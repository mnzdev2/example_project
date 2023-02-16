import 'package:example_project/config/themes/theme_wrapper.dart';
import 'package:example_project/constants/app_constants.dart';
import 'package:example_project/journey/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeWrapper(child: HomePage(title: AppConstants.appName)));
}
