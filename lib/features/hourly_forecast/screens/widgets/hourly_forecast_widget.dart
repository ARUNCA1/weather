import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/models/hourly_forecast_model.dart';
import 'hourly_forecast_details.dart';

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget({Key? key, required this.forecast})
      : super(key: key);
  final List<HourlyForecast> forecast;

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  HexColor("#AC736A").withOpacity(1),
      body: Container(
        height: 200,
        width: 300,


        color:HexColor("#AC736A").withOpacity(1),
        child: Row(
          children: [
            HourlyForecastDetails(forecastList: widget.forecast),
          ],
        ),
      ),
    );
  }
}
