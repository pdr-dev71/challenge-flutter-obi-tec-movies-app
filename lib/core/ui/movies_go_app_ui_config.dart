import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._();

  //static String get title => 'Filmes App';

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF05133A),
        fontFamily: 'Metropolis',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF05133A),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF5FCFED), //  <-- dark color
          textTheme:
              ButtonTextTheme.primary, //  <-- this auto selects the right color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF5FCFED),
          ),
        ),
        primaryColor: const Color(0xFF05133A),
        secondaryHeaderColor: const Color(0xFF000743),
        errorColor: Colors.red,
        brightness: Brightness.light,
        hintColor: Colors.white,
        cardColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Color(0xFFFF3300),
        ),
      );
}
