import 'package:flutter/material.dart';

ThemeData omniDarkBlueTheme() => ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    focusColor: Colors.blue[400],
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    scaffoldBackgroundColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue[900]),
    primaryColor: Colors.blue[100],
    secondaryHeaderColor: Colors.blueGrey[700],
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 15,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 20,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 25,
          fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 30,
          fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 35,
          fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 40,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 25,
          fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      titleSmall: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[300],
          fontSize: 25,
          fontWeight: FontWeight.normal),
      titleMedium: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[300],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      bodySmall: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      labelLarge: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      labelSmall: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.normal),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(getDarkBlueColor),
            foregroundColor:
                WidgetStateColor.resolveWith(getDarkBlueOverlayColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(getDarkBlueColor),
            foregroundColor:
                WidgetStateColor.resolveWith(getDarkBlueOverlayColor),
            shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))))),
    dialogTheme: DialogThemeData(backgroundColor: Colors.blueGrey[900]));

Color getDarkBlueColor(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blueGrey[700]!;
  }
  return Colors.blueGrey[900]!;
}

Color getDarkBlueOverlayColor(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue[100]!;
  }
  return Colors.blue[100]!;
}
