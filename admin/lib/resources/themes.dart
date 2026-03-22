import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData omniDarkBlueTheme() => ThemeData.dark().copyWith(
      colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: Colors.blueGrey[800],
          primary: Colors.blueGrey[200],
          brightness: Brightness.dark,
          surface: Colors.blueGrey[700]),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: Colors.blue[400],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey[700],
          extendedTextStyle: TextStyle(
              inherit: false, color: Colors.blueGrey[100], fontSize: 14)),
      scaffoldBackgroundColor: Colors.blueGrey[900],
      textTheme: GoogleFonts.tajawalTextTheme(TextTheme(
          displayLarge: TextStyle(color: Colors.blueGrey[100]),
          displayMedium: TextStyle(color: Colors.blueGrey[100]),
          displaySmall: TextStyle(color: Colors.blueGrey[100]),
          headlineMedium: TextStyle(color: Colors.blueGrey[100]),
          headlineSmall: TextStyle(color: Colors.blueGrey[100]),
          titleLarge: TextStyle(color: Colors.blueGrey[100]),
          titleMedium: TextStyle(color: Colors.blueGrey[300]),
          titleSmall: TextStyle(color: Colors.blueGrey[500]),
          bodyLarge: TextStyle(color: Colors.blueGrey[100]),
          bodyMedium: TextStyle(color: Colors.blueGrey[100]),
          labelLarge: TextStyle(color: Colors.blueGrey[900]),
          labelSmall: TextStyle(color: Colors.blueGrey[100]),
          bodySmall: TextStyle(color: Colors.blueGrey[100]))),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.blueGrey[900],
        indicatorColor: Colors.blueGrey[100],
        iconTheme: WidgetStateProperty.resolveWith(getDarkBlueOverlayIcon),
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
      listTileTheme: ListTileThemeData(),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              //elevation: MaterialStateProperty.all(10),
              backgroundColor: WidgetStateColor.resolveWith(getDarkBlueColor),
              foregroundColor:
                  WidgetStateColor.resolveWith(getDarkBlueOverlayColor),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              //elevation: MaterialStateProperty.all(10),
              backgroundColor: WidgetStateColor.resolveWith(getDarkBlueColor),
              foregroundColor:
                  WidgetStateColor.resolveWith(getDarkBlueOverlayColor),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))))),
      dialogTheme: DialogThemeData(backgroundColor: Colors.blueGrey[900]),
    );
Color getDarkBlueColor(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blueGrey[700]!;
  }
  return Colors.blueGrey[800]!;
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

TextStyle getDarkBlueOverlayTextStyle(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return TextStyle(color: Colors.blue[100]!);
  }
  return TextStyle(color: Colors.blue[100]!);
}

IconThemeData getDarkBlueOverlayIcon(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.pressed,
    WidgetState.hovered,
    WidgetState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return IconThemeData(color: Colors.blue[900]!);
  }
  return IconThemeData(color: Colors.blue[100]!);
}
