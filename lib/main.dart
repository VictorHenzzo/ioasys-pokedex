import 'package:flutter/material.dart';
import 'package:pokedex_ioasys/modules/home/home_page.dart';
import 'package:pokedex_ioasys/modules/pokemonPage/pokemon_page.dart';

import 'modules/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex ioasys',
      theme: ThemeData(
        primaryColor: const Color(0xFFEC0344),
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: Colors.white),
            headline2: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: Color(0xFFEC0344)),
            headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Color(0xFFEC0344)),
            headline4: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Color(0xFF666666)),
            headline5: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Color(0xFF212121)),
            headline6: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Color(0xFFB2B2B2)),
            subtitle1: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Colors.white),
            subtitle2: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: Colors.white)),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        PokemonPage.routeName: (context) => PokemonPage(),
      },
    );
  }
}
