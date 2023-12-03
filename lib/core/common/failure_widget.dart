
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_images.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppLottie.failure),
          Text(text ?? "Error"),
        ],
      ),
    );
  }
}
