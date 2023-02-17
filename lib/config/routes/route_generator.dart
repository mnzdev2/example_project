import 'package:example_project/constants/route_constants.dart';
import 'package:example_project/journey/home/presentation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initialScreen:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteConstants.settingScreen:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('settings screen'),
          ),
        );
      default:
        _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('PAGE NOT FOUND!!!'),
          ),
        );
      },
    );
  }
}
