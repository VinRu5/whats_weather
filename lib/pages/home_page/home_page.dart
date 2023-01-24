import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_weather/blocs/weather/weather_bloc.dart';
import 'package:whats_weather/misc/painter/weather_arc.dart';
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
    // GeoServices()
    //   ..determinePosition().then((value) {
    //     print(value);
    //   });
    // final DateTime today = DateTime.now();
    // final DateTime endWeek = today.add(const Duration(days: 1));
    // WeatherService()
    //   ..getWeather(
    //     today,
    //     endWeek,
    //     52.520551,
    //     13.461804,
    //   );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc(context.read<WeatherRepository>())..getWeatherData(),
      child: Scaffold(
        backgroundColor: WeatherTheme.backRose,
        appBar: appBar,
        body: body,
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

  Widget get body => BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is LoadedWeatherState) {
            return ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                HeaderInfo(
                  weatherDay: state.weatherDay,
                ),
                divider(),
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
        },
      );

  Widget divider() => SizedBox(
        height: 100,
        child: CustomPaint(
          painter: WeatherArc(),
          child: Center(
            child: Text("24 Marzo".toUpperCase()),
          ),
        ),
      );
}
