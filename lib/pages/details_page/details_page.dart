import 'package:flutter/material.dart';
import 'package:whats_weather/models/args/details_page_args.dart';
import 'package:whats_weather/pages/home_page/widget/main_view.dart';

class DetailsPage extends StatelessWidget {
  final DetailsPageArgs? args;

  const DetailsPage({
    required this.args,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MainView(
        isDetailsPage: true,
        date: args?.date,
      );
}
