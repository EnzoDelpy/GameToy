import 'package:game_toy/classes/morpion.dart';

import 'plateau.dart';

class Affichage {
  static String afficheJoueur(Morpion partie) {
    return "Tour des " + partie.getJoueur();
  }

  static String afficheVainqueur(String joueur) {
    return "Les " + joueur + " ont gagnés!";
  }

  static String afficheNul() {
    return "Match nul!";
  }
}
