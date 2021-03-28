import 'package:flutter/material.dart';

ThemeData omniDarkBlueTheme() => ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    focusColor: Colors.blue[400],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(color: Colors.blue[900]),
    accentColor: Colors.blue[400],
    primaryColor: Colors.blue[100],
    secondaryHeaderColor: Colors.blueGrey[700],
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 15,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 20,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 25,
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 30,
          fontWeight: FontWeight.bold),
      headline5: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 35,
          fontWeight: FontWeight.bold),
      headline6: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 40,
          fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 25,
          fontWeight: FontWeight.normal),
      bodyText1: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      subtitle2: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[300],
          fontSize: 25,
          fontWeight: FontWeight.normal),
      subtitle1: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[300],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      caption: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      button: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.normal),
      overline: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.normal),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getDarkBlueColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getDarkBlueOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getDarkBlueColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getDarkBlueOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    dialogBackgroundColor: Colors.blueGrey[900]);

Color getDarkBlueColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue[400]!;
  }
  return Colors.blueGrey[900]!;
}

Color getDarkBlueOverlayColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue[100]!;
  }
  return Colors.blue[100]!;
}
