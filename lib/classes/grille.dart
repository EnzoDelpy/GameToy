import 'dart:math';

class Grille {
  int _taille;
  List<List<String>> _grille = [];

  Grille(this._taille) {
    for (int k = 0; k < this._taille; k++) {
      this._grille.add([]);
      for (int i = 0; i < this._taille; i++) {
        if (k == this._taille - 1 && i == this._taille - 1) {
          this._grille[k].add('');
        } else {
          this._grille[k].add(((i + 1) + k * _taille).toString());
        }
      }
    }
  }

  int getTaille() {
    return this._taille;
  }

  List<List<String>> getGrille() {
    return this._grille;
  }

  List<int> getEmplacement(String valeur) {
    for (int k = 0; k < this._taille; k++) {
      for (int i = 0; i < this._taille; i++) {
        if (this._grille[k][i] == valeur) {
          return [k, i];
        }
      }
    }
    return [];
  }

  List<int> peutDeplacer(List<int> emplacement) {
    if (this._grille[emplacement[0]][emplacement[1]] == '') {
      return [-1, -1];
    }
    if (emplacement[0] > 0 && emplacement[0] < this._taille - 1) {
      if (_grille[emplacement[0] - 1][emplacement[1]] == '') {
        return [emplacement[0] - 1, emplacement[1]];
      } else if (_grille[emplacement[0] + 1][emplacement[1]] == '') {
        return [emplacement[0] + 1, emplacement[1]];
      }
    } else if (emplacement[0] == 0) {
      if (_grille[emplacement[0] + 1][emplacement[1]] == '') {
        return [emplacement[0] + 1, emplacement[1]];
      }
    } else {
      if (_grille[emplacement[0] - 1][emplacement[1]] == '') {
        return [emplacement[0] - 1, emplacement[1]];
      }
    }

    if (emplacement[1] > 0 && emplacement[1] < this._taille - 1) {
      if (_grille[emplacement[0]][emplacement[1] - 1] == '') {
        return [emplacement[0], emplacement[1] - 1];
      } else if (_grille[emplacement[0]][emplacement[1] + 1] == '') {
        return [emplacement[0], emplacement[1] + 1];
      }
    } else if (emplacement[1] == 0) {
      if (_grille[emplacement[0]][emplacement[1] + 1] == '') {
        return [emplacement[0], emplacement[1] + 1];
      }
    } else {
      if (_grille[emplacement[0]][emplacement[1] - 1] == '') {
        return [emplacement[0], emplacement[1] - 1];
      }
    }

    return [-1, -1];
  }

  void deplaceCase(String valeur) {
    List<int> emplacementVide = peutDeplacer(getEmplacement(valeur));
    if (emplacementVide[0] == -1) {
      return;
    } else {
      List<int> emplacement = getEmplacement(valeur);
      _grille[emplacementVide[0]][emplacementVide[1]] =
          _grille[emplacement[0]][emplacement[1]];
      _grille[emplacement[0]][emplacement[1]] = '';
    }
  }

  void melange() {
    for (int k = 0; k < 100; k++) {
      var rng = Random();
      int val = rng.nextInt(_taille * _taille - 1) + 1;
      deplaceCase(val.toString());
    }
  }
}
