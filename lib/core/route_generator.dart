import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sonda/core/constants/durations.dart';

import '../core/constants/config/logger.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/details_screen.dart';

class RouteGenerator {
  static const String initialRoute = HomeScreen.homeScreenId;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

    switch (settings.name) {
      case HomeScreen.homeScreenId:
        return PageTransition<dynamic>(
          child: const HomeScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: Durations.shortDuration,
          settings: const RouteSettings(name: 'HomePage'),
        );

      case DetailsScreen.detailsScreenId:
        return PageTransition<dynamic>(
          child: const DetailsScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: Durations.shortDuration,
          settings: const RouteSettings(name: 'HomePage'),
        );
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? route) {
    Logger.log('Route not found : $route');
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR!!!'),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  Icon(
                    Icons.error_sharp,
                    color: Colors.red,
                    size: 150,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Screen not found... How did you end up here? 🤔'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
