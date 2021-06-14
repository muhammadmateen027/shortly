import 'package:design/view/view.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings setting) {
    final args = setting.arguments;
    switch (setting.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => SplashPage());
        break;

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
        break;

      case Routes.dashboardPage:
        return MaterialPageRoute(builder: (_) => DashboardPage());
        break;

      case Routes.historyPage:
        return MaterialPageRoute(builder: (_) => HistoryPage());
        break;


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Not available'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Text(
              'You requested page is not available at the moment.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });
  }
}
