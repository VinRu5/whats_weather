import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whats_weather/misc/painter/weather_arc.dart';
import 'package:whats_weather/pages/home_page/widget/header_info.dart';
import 'package:whats_weather/pages/home_page/widget/more_info.dart';
import 'package:whats_weather/services/geo_services.dart';
import 'package:whats_weather/services/network/weather_service.dart';
import 'package:whats_weather/theme/weather_theme.dart';

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
    return Scaffold(
      backgroundColor: WeatherTheme.backRose,
      appBar: appBar,
      body: body,
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

  Widget get body => ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          HeaderInfo(),
          divider(),
          MoreInfo(),
        ],
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
