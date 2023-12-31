
import 'package:lottie/lottie.dart';

import '../utils/app_images.dart';

class LottieCache {
  static final Map<String, LottieComposition> _compositions = {};

  /// Caches the given [LottieAsset]s.

  static Future<void> add(String assetName) async {
    _compositions[assetName] = await AssetLottie(assetName).load();
  }

  static cache() {
    add(AppLottie.fetchLocation);
    add(AppLottie.locationNotFound);
    add(AppLottie.noInternet);
    add(AppLottie.loadingWeather);
    add(AppLottie.failure);
  }
}
