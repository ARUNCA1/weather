
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_dimn.dart';
import '../../../../core/utils/app_typography.dart';
import '../../../home/screens/widgets/widgets.dart';
import '../../data/models/hourly_forecast_model.dart';

class HourlyForecastDetails extends StatelessWidget {
  const HourlyForecastDetails({
    super.key,
    required this.forecastList,
  });

  final List<HourlyForecast> forecastList;

  @override
  Widget build(BuildContext context) {
    return
      Container(
          height: 193,
          width: 200,
         child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
            padding: EdgeInsets.all(8.0), // padding around the grid
            itemCount: forecastList.length, // total number of items
            itemBuilder: (context, index) {
              return Container(
             // color of grid items
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        forecastList[index].hours,
                        style: TextStyle(fontSize: 13.0, color: Colors.white),
                      ),
                           Container(height: 1,color: Colors.white,),
                           Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ve.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            forecastList[index].temperature,
                            style: TextStyle(fontSize: 13.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )  );
    //
    //   Container(
    //   height: 200,
    //   width: 300,
    //   child: ListView.separated(
    //     itemCount: forecastList.length,
    //     padding: const EdgeInsets.only(left: 16),
    //     scrollDirection: Axis.horizontal,
    //     physics: const BouncingScrollPhysics(),
    //     itemBuilder: (context, index) => Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: Theme.of(context).focusColor,
    //       ),
    //       width: AppDimensions.width! * 0.25,
    //       padding: const EdgeInsets.all(8),
    //       child: Column(
    //         children: [
    //           Expanded(
    //             child: Text(forecastList[index].hours),
    //           ),
    //           Expanded(
    //             flex: 3,
    //             child: RepaintBoundary(
    //               child: Lottie.asset(forecastList[index].image),
    //             ),
    //           ),
    //           // const SizedBox(height: 8),
    //           // Expanded(
    //           //   child: Text(
    //           //     forecastList[index].temperature,
    //           //     style: AppTypography.medium14(),
    //           //   ),
    //           // ),
    //           // Expanded(
    //           //   child: Row(
    //           //     mainAxisAlignment: MainAxisAlignment.center,
    //           //     children: [
    //           //       const Icon(Icons.water_drop_outlined, size: 16),
    //           //       Text(forecastList[index].humidity),
    //           //     ],
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //     ),
    //     separatorBuilder: (context, index) => const SizedBox(width: 8),
    //   ),
    // );
    //
  }
}
