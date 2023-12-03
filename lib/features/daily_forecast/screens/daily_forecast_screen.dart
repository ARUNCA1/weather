
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wharmino/features/daily_forecast/screens/widgets/forecast_widget.dart';

import '../../../core/common/failure_widget.dart';
import '../../../core/common/loading_widget.dart';
import '../cubit/daily_forecast_cubit.dart';

class Forecast5DaysScreen extends StatelessWidget {
  const Forecast5DaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyForecastCubit, DailyForecastState>(
      builder: (context, state) {
        if (state is DailyForecastInitial) {
          return const LoadingWidget();
        } else if (state is DailyForecastLoaded) {
          return ForecastWidget(forecast: state.forecast);
        } else if (state is DailyForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else {
          return const FailureWidget();
        }
      },
    );
  }
}
