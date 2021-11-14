import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData omniDarkBlueTheme() => ThemeData.dark().copyWith(
      colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: Colors.blueGrey[800],
          background: Colors.blueGrey[900],
          primary: Colors.blueGrey[200],
          brightness: Brightness.dark,
          surface: Colors.blueGrey[700]),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: Colors.blue[400],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey[700],
          extendedTextStyle: TextStyle(
              inherit: false, color: Colors.blueGrey[100], fontSize: 14)),
      dialogBackgroundColor: Colors.blueGrey[900],
      scaffoldBackgroundColor: Colors.blueGrey[900],
      textTheme: GoogleFonts.tajawalTextTheme(TextTheme(
          headline1: TextStyle(color: Colors.blueGrey[100]),
          headline2: TextStyle(color: Colors.blueGrey[100]),
          headline3: TextStyle(color: Colors.blueGrey[100]),
          headline4: TextStyle(color: Colors.blueGrey[100]),
          headline5: TextStyle(color: Colors.blueGrey[100]),
          headline6: TextStyle(color: Colors.blueGrey[100]),
          subtitle1: TextStyle(color: Colors.blueGrey[300]),
          subtitle2: TextStyle(color: Colors.blueGrey[500]),
          bodyText1: TextStyle(color: Colors.blueGrey[100]),
          bodyText2: TextStyle(color: Colors.blueGrey[100]),
          button: TextStyle(color: Colors.blueGrey[900]),
          overline: TextStyle(color: Colors.blueGrey[100]),
          caption: TextStyle(color: Colors.blueGrey[100]))),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.blueGrey[900],
        indicatorColor: Colors.blueGrey[100],
        iconTheme: MaterialStateProperty.resolveWith(getDarkBlueOverlayIcon),
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
      listTileTheme: ListTileThemeData(),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              //elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateColor.resolveWith(getDarkBlueColor),
              foregroundColor:
                  MaterialStateColor.resolveWith(getDarkBlueOverlayColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              //elevation: MaterialStateProperty.all(10),
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
  return Colors.blueGrey[800]!;
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

TextStyle getDarkBlueOverlayTextStyle(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return TextStyle(color: Colors.blue[100]!);
  }
  return TextStyle(color: Colors.blue[100]!);
}

IconThemeData getDarkBlueOverlayIcon(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return IconThemeData(color: Colors.blue[900]!);
  }
  return IconThemeData(color: Colors.blue[100]!);
}
