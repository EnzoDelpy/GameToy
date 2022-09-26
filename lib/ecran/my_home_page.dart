import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: Image.asset('Assets/Images/gameboy.png'));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GameToy"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/route2'),
                child: Text("Taquin"),
                style: ElevatedButton.styleFrom(primary: Colors.amber)),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/route3'),
                child: Text("TicTacToe"),
                style: ElevatedButton.styleFrom(primary: Colors.red)),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )));
  }
}
