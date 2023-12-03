
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wharmino/features/hourly_forecast/screens/widgets/hourly_forecast_widget.dart';

import '../../../core/common/failure_widget.dart';
import '../../../core/common/loading_widget.dart';
import '../cubit/hourly_forecast_cubit.dart';

class HourlyForecastScreen extends StatelessWidget {
  const HourlyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HourlyForecastCubit, HourlyForecastState>(
      builder: (context, state) {
        if (state is HourlyForecastInitial) {
          return const LoadingWidget();
        } else if (state is HourlyForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else if (state is HourlyForecastLoaded) {
          return HourlyForecastWidget(forecast: state.forecast);
        } else {
          return const Center(child: Text("Something Wrong"));
        }
      },
    );
  }
}
