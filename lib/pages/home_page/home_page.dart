import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:whats_weather/blocs/weather/weather_bloc.dart';
import 'package:whats_weather/errors/repository_error.dart';
import 'package:whats_weather/misc/painter/weather_arc.dart';
import 'package:whats_weather/models/enum/weather_status.dart';
import 'package:whats_weather/models/position_city.dart';
import 'package:whats_weather/pages/home_page/widget/header_info.dart';
import 'package:whats_weather/pages/home_page/widget/more_info.dart';
import 'package:whats_weather/repositories/geo_repository.dart';
import 'package:whats_weather/repositories/weather_repository.dart';
import 'package:whats_weather/theme/weather_theme.dart';
import 'package:whats_weather/widgets/loading_widget.dart';
import 'package:whats_weather/widgets/toast_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSearchBar = false;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        context.read<WeatherRepository>(),
        context.read<GeoRepository>(),
      )..getWeatherData(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state is LoadedWeatherState
                ? getBackgroundColor(
                    state.weatherDay.weatherSymbol,
                    state.weatherDay.temperature,
                    state.weatherDay.isNight,
                  )
                : WeatherTheme.backRose,
            appBar: appBar(
              context,
              state is LoadedWeatherState ? state.cityName : "",
            ),
            body: body(state),
          );
        },
      ),
    );
  }

  AppBar appBar(BuildContext context, String cityName) => AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: WeatherTheme.trasparent,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   systemNavigationBarIconBrightness: Brightness.dark,
        // ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              showSearchBar = !showSearchBar;
              if (showSearchBar) {
                searchFocus.requestFocus();
              }
            });
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: WeatherTheme.black,
            size: 18.0,
          ),
        ),
        title: showSearchBar
            ? searchBar(context)
            : Text(
                cityName.toUpperCase(),
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
          divider(
            state.weatherDay.date,
            state.weatherDay.sunrise,
            state.weatherDay.sunset,
          ),
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

  Widget divider(
    DateTime date,
    DateTime sunrise,
    DateTime sunset,
  ) =>
      SizedBox(
        height: 100,
        width: double.infinity,
        child: CustomPaint(
          painter: WeatherArc(
            dayValue: getDayValue(
              sunrise,
              sunset,
            ),
          ),
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
    bool isNight,
  ) {
    if (isNight) {
      return WeatherTheme.backBlack;
    }

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

  double getDayValue(
    DateTime sunrise,
    DateTime sunset,
  ) {
    final DateTime now = DateTime.now();
    if (now.millisecondsSinceEpoch < sunset.millisecondsSinceEpoch ||
        now.millisecondsSinceEpoch > sunrise.millisecondsSinceEpoch) {
      return (now.millisecondsSinceEpoch - sunrise.millisecondsSinceEpoch) /
          (sunset.millisecondsSinceEpoch - sunrise.millisecondsSinceEpoch);
    }

    return 1;
  }

  Widget searchBar(BuildContext context) => Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              focusNode: searchFocus,
              textInputAction: TextInputAction.done,
              cursorColor: WeatherTheme.white,
              decoration: inputStyle,
              onChanged: (value) {},
              onSubmitted: (_) {
                _confirmCity(context);
              },
            ),
          ),
          IconButton(
            onPressed: () => _confirmCity(context),
            icon: const Icon(FontAwesomeIcons.check),
          )
        ],
      );

  InputDecoration get inputStyle => InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
        focusColor: WeatherTheme.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: WeatherTheme.white),
          borderRadius: BorderRadius.circular(24.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: WeatherTheme.white),
          borderRadius: BorderRadius.circular(24.0),
        ),
      );

  void _confirmCity(BuildContext context) async {
    setState(() {
      showSearchBar = false;
    });

    PositionCity? myPosition;

    try {
      myPosition = await context
          .read<GeoRepository>()
          .getPositionFromCityName(searchController.text);
    } on RepositoryError catch (e) {
      ToastMessage.showErrorToast(context, e.message ?? '');
      return;
    }

    context.read<WeatherBloc>().getWeatherData(myPosition);
    //check(context, myPosition);

    print(myPosition);

    ///TODO:: Avviare la ricerca
  }

  check(BuildContext context, PositionCity myPosition) {}
}
