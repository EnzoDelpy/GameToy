import 'package:flutter/material.dart';
import 'package:game_toy/classes/affichage.dart';
import 'package:game_toy/classes/morpion.dart';

class MorpionEcran extends StatefulWidget {
  const MorpionEcran({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MorpionEcran> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MorpionEcran> {
  int _counter = 0;
  bool victoire = false;
  Morpion partie = Morpion();
  String texte = "Tour des x";
  List<Color> couleurIcones =
      new List.generate(9, (index) => Color(0xFF292C6D));

  List<IconData?> etatIcone = new List.generate(9, (index) => null);

  Container createCase(index) {
    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF292C6D)),
          fixedSize: MaterialStateProperty.all(
            Size.fromRadius(45),
          ),
        ),
        child: Icon(
          etatIcone[index],
          color: couleurIcones[index],
          size: 50,
        ),
        onPressed: () => {cocheCase(index)},
      ),
    );
  }

  void cocheCase(int numCase) {
    setState(() {
      if (victoire == false && partie.getPlateau().libre(numCase + 1)) {
        this.couleurIcones[numCase] = Color(0xFFEC255A);
        if (partie.getJoueur() == "x") {
          this.etatIcone[numCase] = Icons.close;
        } else {
          this.etatIcone[numCase] = Icons.circle_outlined;
        }
        partie.getPlateau().majCase(numCase + 1, partie.getJoueur());
        if (partie.getPlateau().vainqueur(partie.getJoueur()) == true) {
          texte = Affichage.afficheVainqueur(partie.getJoueur());
          victoire = true;
          return;
        }
        partie.augmenteNbTour();
        if (partie.getNbTour() > 9) {
          texte = Affichage.afficheNul();
          victoire = true;
        } else {
          texte = Affichage.afficheJoueur(partie);
        }
      }
    });
  }

  void resetPartie() {
    setState(() {
      texte = "Tour des x";
      victoire = false;
      this.partie.resetPartie();
      couleurIcones = List.generate(9, (index) => Color(0xFF292C6D));
      etatIcone = List.generate(9, (index) => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161853),
      appBar: AppBar(
        backgroundColor: Color(0xFF292C6D),
        centerTitle: true,
        title: Text(widget.title,
            style: const TextStyle(color: Color(0xFFFAEDF0))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createCase(0),
                createCase(1),
                createCase(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createCase(3),
                createCase(4),
                createCase(5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                createCase(6),
                createCase(7),
                createCase(8),
              ],
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            Text(
              this.texte,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFAEDF0),
                  fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF292C6D)),
              ),
              child: const Text("Recommencer la partie",
                  style: const TextStyle(color: Color(0xFFFAEDF0))),
              onPressed: () => resetPartie(),
            ),
          ],
        ),
      ),
    );
  }
}
