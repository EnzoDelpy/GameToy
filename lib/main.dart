import 'package:flutter/material.dart';
import 'package:game_toy/ecran/morpionEcran.dart';
import 'package:game_toy/ecran/my_home_page.dart';
import 'package:game_toy/ecran/tacquin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Page principale'),
        routes: <String, WidgetBuilder>{
          '/route1': (BuildContext context) => MyHomePage(title: 'Page 1'),
          '/route2': (BuildContext context) => Tacquin(title: 'Taquin'),
          '/route3': (BuildContext context) => MorpionEcran(title: 'Morpion'),
        });
  }
}
