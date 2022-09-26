import 'plateau.dart';

class Morpion {
  int _nbTour = 1;
  Plateau _plateau = new Plateau();

  Morpion();

  void setPlateau(plateau) {
    this._plateau = plateau;
  }

  Plateau getPlateau() {
    return this._plateau;
  }

  void setNbTour(nbTour) {
    this._nbTour = nbTour;
  }

  int getNbTour() {
    return this._nbTour;
  }

  void augmenteNbTour() {
    this._nbTour++;
  }

  void resetNbTour() {
    this._nbTour = 1;
  }

  String getJoueur() {
    if (this._nbTour % 2 == 1) {
      return "x";
    } else {
      return "o";
    }
  }

  void resetPartie() {
    this.resetNbTour();
    this._plateau.resetPlateau();
  }
}
