
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wharmino/features/landing_page/widgets/bottom_nav_bar_list.dart';
import 'package:wharmino/features/landing_page/widgets/permission_denied_widget.dart';
import 'package:wharmino/features/landing_page/widgets/screens.dart';
import 'package:wharmino/features/landing_page/widgets/waiting_permission_widget.dart';

import '../../core/global/variables.dart';
import '../../core/services/get_it_service.dart';
import '../daily_forecast/cubit/daily_forecast_cubit.dart';
import '../daily_forecast/data/repo/daily_forecast_repo.dart';
import '../home/cubit/home_cubit.dart';
import '../home/data/repo/home_repo.dart';
import '../hourly_forecast/cubit/hourly_forecast_cubit.dart';
import '../hourly_forecast/screens/hourly_forecast_screen.dart';
import '../hourly_forecast/screens/widgets/hourly_forecast_details.dart';
import 'bloc/location/location_bloc.dart';
import 'bloc/nav_bar/nav_bar_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc()..add(GetLocationEvent()),
        ),
        BlocProvider(
          create: (context) => HomeCubit(getIt.get<HomeRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              DailyForecastCubit(getIt.get<DailyForecastRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              HourlyForecastCubit(getIt.get<DailyForecastRepository>()),
        ),
      ],
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is AskForLocationPermissionState) {
            return const WaitingPermissionWidget();
          } else if (state is LocationPermissionDeniedState) {
            return const PermissionDeniedWidget();
          } else if (state is FetchCurrentLocationState) {
            GlobalVariablesState.lat = state.latitude;
            GlobalVariablesState.lon = state.longitude;
            fetchData(
              context,
              lat: state.latitude,
              lon: state.longitude,
            );
            return BlocBuilder<NavBarBloc, NavBarState>(
              builder: (context, state) {
                return Scaffold(
                  body: RefreshIndicator(
                    onRefresh: () async {
                      fetchData(
                        context,
                        lat: GlobalVariablesState.lat,
                        lon: GlobalVariablesState.lon,
                      );
                    },
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/Cover.png",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          Scaffold(
                            backgroundColor: Colors.transparent,

                            body: Container(
                              // height: 350,

                             // color: Colors.black,
                              child: CustomScrollView(
                                slivers: [
                                  SliverFillRemaining(
                                    child: screens.elementAt(state.tabIndex),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                );
              },
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Unhandled Error"),
              ),
            );
          }
        },
      ),
    );
  }

  void fetchData(BuildContext context,
      {required double? lat, required double? lon}) async {
    BlocProvider.of<DailyForecastCubit>(context).fetchForecast5DaysData(
      lat: lat,
      lon: lon,
    );
    BlocProvider.of<HourlyForecastCubit>(context).fetchForecast5DaysData(
      lat: lat,
      lon: lon,
    );
    BlocProvider.of<HomeCubit>(context).getTodayWeather(
      latitude: lat,
      longitude: lon,
    );
  }
}
