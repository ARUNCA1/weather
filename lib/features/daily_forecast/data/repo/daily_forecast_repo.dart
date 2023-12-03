
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_handling.dart';
import '../models/forecast_5_days_model.dart';

abstract class DailyForecastRepository {
  Future<Either<IErrorHandler, Forecast5DaysModel>> fetchForecast5Days(
      double? latitude, double? longitude);
}
