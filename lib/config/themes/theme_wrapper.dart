import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

import 'app_themes.dart';

class ThemeWrapper extends StatelessWidget {
  final Widget child;
  const ThemeWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = ThemeData.dark();
    final darkButtonTheme =
        dark.buttonTheme.copyWith(buttonColor: Colors.grey[700]);
    final darkFABTheme = dark.floatingActionButtonTheme;

    final themeCollection = ThemeCollection(themes: {
      AppThemes.lightBlue: ThemeData(primarySwatch: Colors.blue),
      AppThemes.lightRed: ThemeData(primarySwatch: Colors.red),
      AppThemes.darkBlue: dark.copyWith(
          buttonTheme: darkButtonTheme,
          floatingActionButtonTheme:
              darkFABTheme.copyWith(backgroundColor: Colors.blue),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
      AppThemes.darkRed: ThemeData.from(
          colorScheme: const ColorScheme.dark(
              primary: Colors.red, secondary: Colors.red)),
    });

    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.lightBlue,
        builder: (context, theme) {
          return MaterialApp(
            title: 'dynamic_themes example',
            theme: theme,
            home: child,
          );
        });
  }
}
