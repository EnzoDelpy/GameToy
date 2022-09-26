import 'package:flutter/material.dart';
import 'package:game_toy/classes/grille.dart';

class Tacquin extends StatefulWidget {
  const Tacquin({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Tacquin> createState() => _TacquinState();
}

class _TacquinState extends State<Tacquin> {
  Grille maGrille = new Grille(3);

  Widget buildCase(String valeur) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            Size.fromRadius(45),
          ),
        ),
        onPressed: () => setState(() {
              maGrille.deplaceCase(valeur);
            }),
        child: Text(valeur));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...List.generate(
            maGrille.getTaille(),
            (y) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(maGrille.getTaille(),
                  (x) => buildCase(maGrille.getGrille()[y][x])),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setState(() {
                  maGrille.melange();
                }),
                child: Text('melanger'),
              )
            ],
          )
        ]),
      ),
    );
  }
}
