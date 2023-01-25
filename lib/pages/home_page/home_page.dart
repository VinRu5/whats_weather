import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:whats_weather/blocs/weather/weather_bloc.dart';
import 'package:whats_weather/misc/painter/weather_arc.dart';
import 'package:whats_weather/models/enum/weather_status.dart';
import 'package:whats_weather/pages/home_page/widget/header_info.dart';
import 'package:whats_weather/pages/home_page/widget/more_info.dart';
import 'package:whats_weather/repositories/weather_repository.dart';
import 'package:whats_weather/theme/weather_theme.dart';
import 'package:whats_weather/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc(context.read<WeatherRepository>())..getWeatherData(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state is LoadedWeatherState
                ? getBackgroundColor(
                    state.weatherDay.weatherSymbol,
                    state.weatherDay.temperature,
                  )
                : WeatherTheme.backRose,
            appBar: appBar,
            body: body(state),
          );
        },
      ),
    );
  }

  AppBar get appBar => AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: WeatherTheme.trasparent,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   systemNavigationBarIconBrightness: Brightness.dark,
        // ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: WeatherTheme.black,
            size: 18.0,
          ),
        ),
        title: Text(
          "Cosenza".toUpperCase(),
          style: WeatherTheme.titleApp,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "C°",
                  style: WeatherTheme.titleApp,
                ),
              ],
            ),
          )
        ],
      );

  Widget body(WeatherState state) {
    if (state is LoadedWeatherState) {
      return ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          HeaderInfo(
            weatherDay: state.weatherDay,
          ),
          divider(state.weatherDay.date),
          MoreInfo(
            weatherDay: state.weatherDay,
          ),
        ],
      );
    } else if (state is ErrorWeatherState) {
      return Center(
        child: Text(state.errorMessage ?? ''),
      );
    }

    return const LoadingWidget();
  }

  Widget divider(DateTime date) => SizedBox(
        height: 100,
        child: CustomPaint(
          painter: WeatherArc(),
          child: Center(
            child: Text(
              dateString(date),
              style: WeatherTheme.dateStyle,
            ),
          ),
        ),
      );

  String dateString(DateTime date) {
    final DateTime myDate = DateTime(date.year, date.month, date.day);

    final DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    if (myDate.millisecondsSinceEpoch == today.millisecondsSinceEpoch) {
      return "oggi".toUpperCase();
    }

    return DateFormat("d MMMM", "it").format(date).toUpperCase();
  }

  Color getBackgroundColor(
    WeatherStatus status,
    double temperature,
  ) {
    if (status == WeatherStatus.clearSky) {
      if (temperature < 22.0) {
        return WeatherTheme.backBlue;
      }
      return WeatherTheme.backRose;
    }

    if ([
      WeatherStatus.lightClouds,
      WeatherStatus.partlyCloudy,
      WeatherStatus.rainShower,
      WeatherStatus.ligthFog,
    ].contains(status)) {
      return WeatherTheme.backBlue;
    }

    if ([
      WeatherStatus.cloudy,
      WeatherStatus.rain,
      WeatherStatus.denseFog,
      WeatherStatus.drizzle,
    ].contains(status)) {
      return WeatherTheme.backGreen;
    }

    if ([
      WeatherStatus.snow,
      WeatherStatus.rainAndSnow,
      WeatherStatus.snowShower,
      WeatherStatus.sleetShower,
      WeatherStatus.freezingRain,
      WeatherStatus.thunderstorms,
      WeatherStatus.sandstorm,
    ].contains(status)) {
      return WeatherTheme.backBrown;
    }

    return WeatherTheme.backRose;
  }
}
