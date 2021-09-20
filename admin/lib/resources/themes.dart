import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData omniDarkBlueTheme() => ThemeData.dark().copyWith(
      colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: Colors.blue[100],
          background: Colors.blueGrey[900],
          primary: Colors.blue[400],
          brightness: Brightness.dark,
          surface: Colors.blue[400]),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: Colors.blue[400],
      dialogBackgroundColor: Colors.blueGrey[900],
      scaffoldBackgroundColor: Colors.blueGrey[900],
      textTheme: GoogleFonts.tajawalTextTheme(TextTheme(
          headline1: TextStyle(color: Colors.blue[100]),
          headline2: TextStyle(color: Colors.blue[100]),
          headline3: TextStyle(color: Colors.blue[100]),
          headline4: TextStyle(color: Colors.blue[100]),
          headline5: TextStyle(color: Colors.blue[100]),
          headline6: TextStyle(color: Colors.blue[100]),
          subtitle1: TextStyle(color: Colors.blue[100]),
          subtitle2: TextStyle(color: Colors.blue[100]),
          bodyText1: TextStyle(color: Colors.blue[100]),
          bodyText2: TextStyle(color: Colors.blue[100]),
          button: TextStyle(color: Colors.blue[100]))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateColor.resolveWith(getDarkBlueColor),
              foregroundColor:
                  MaterialStateColor.resolveWith(getDarkBlueOverlayColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))))),
    );
Color getDarkBlueColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blueGrey[700]!;
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
