
import 'package:flutter/material.dart';

import '../../../core/animations/play_lottie.dart';
import '../../../core/utils/app_images.dart';

class WaitingPermissionWidget extends StatelessWidget {
  const WaitingPermissionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayLottie(lottie: AppLottie.fetchLocation),
            Text("Looking for your location"),
          ],
        ),
      ),
    );
  }
}
