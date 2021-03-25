import 'package:flutter/material.dart';

/*
ThemeData omniLightRedTheme() => ThemeData.light().copyWith(
  
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.red[100],
    appBarTheme: AppBarTheme(color: Colors.red[100]),
    accentColor: Colors.red[400],
    
    textTheme: TextTheme(
      
      bodyText2: GoogleFonts.tajawal(
          color: Colors.red[400], fontSize: 20, fontWeight: FontWeight.bold),
      bodyText1: GoogleFonts.tajawal(
          color: Colors.red[400], fontSize: 15, fontWeight: FontWeight.bold),
      headline6: GoogleFonts.tajawal(
          color: Colors.red[400], fontSize: 30, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getLightRedColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getLightRedOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getLightRedColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getLightRedOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    dialogBackgroundColor: Colors.red[100]);*/
/*ThemeData omniDarkRedTheme() => ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(color: Colors.red[900]),
    accentColor: Colors.red[400],
    textTheme: TextTheme(
      headline6: GoogleFonts.tajawal(
          color: Colors.red[100], fontSize: 30, fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.tajawal(
          color: Colors.red[100], fontSize: 20, fontWeight: FontWeight.bold),
      bodyText1: GoogleFonts.tajawal(
          color: Colors.red[100], fontSize: 15, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getDarkRedColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getDarkRedOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getDarkRedColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getDarkRedOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    dialogBackgroundColor: Colors.blueGrey[900]);
*/
/*
Color getLightRedColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.red[400]!;
  }
  return Colors.red[100]!;
}

Color getLightRedOverlayColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.red[100]!;
  }
  return Colors.red[400]!;
}

Color getDarkRedColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.red[400]!;
  }
  return Colors.blueGrey[900]!;
}

Color getDarkRedOverlayColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.red[100]!;
  }
  return Colors.red[100]!;
}
*/
/*
ThemeData omniLightBlueTheme() => ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.blue[100],
    appBarTheme: AppBarTheme(color: Colors.blue[100]),
    accentColor: Colors.blue[400],
    //primaryColor: Colors.blue[400],
    textTheme: TextTheme(
      bodyText2: GoogleFonts.tajawal(
        color: Colors.blue[400],
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: GoogleFonts.tajawal(
          color: Colors.blue[400], fontSize: 15, fontWeight: FontWeight.bold),
      headline6: GoogleFonts.tajawal(
          color: Colors.blue[400], fontSize: 30, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getLightBlueColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getLightBlueOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(getLightBlueColor),
            foregroundColor:
                MaterialStateColor.resolveWith(getLightBlueOverlayColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()))),
    dialogBackgroundColor: Colors.blue[100]);*/
ThemeData omniDarkBlueTheme() => ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(color: Colors.blue[900]),
    accentColor: Colors.blue[400],
    primaryColor: Colors.blue[100],
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 5,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 10,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 15,
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 20,
          fontWeight: FontWeight.bold),
      headline5: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 25,
          fontWeight: FontWeight.bold),
      headline6: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[100],
          fontSize: 30,
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
          fontSize: 15,
          fontWeight: FontWeight.normal),
      subtitle1: TextStyle(
          fontFamily: 'Tajawal',
          color: Colors.blue[300],
          fontSize: 10,
          fontWeight: FontWeight.normal),
      caption: TextStyle(
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
/*
Color getLightBlueColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue[400]!;
  }
  return Colors.blue[100]!;
}

Color getLightBlueOverlayColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue[100]!;
  }
  return Colors.blue[400]!;
}
*/
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
