class Plateau {
  List<String> _cases = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  void setCases(cases) {
    this._cases = cases;
  }

  List<String> getCases() {
    return this._cases;
  }

  bool libre(num) {
    if (num < 1 || num > 9) {
      return false;
    } else if (this._cases[num - 1] == "x" || this._cases[num - 1] == "o") {
      return false;
    } else {
      return true;
    }
  }

  void majCase(num, carac) {
    this._cases[num - 1] = carac;
  }

  bool vainqueur(carac) {
    bool vainqueur = false;
    int j = 0;
    for (int i = 0; i < 3; i++) {
      if (this._cases[i] == carac &&
          this._cases[i + 3] == carac &&
          this._cases[i + 6] == carac) {
        vainqueur = true;
      }
      if (this._cases[j] == carac &&
          this._cases[j + 1] == carac &&
          this._cases[j + 2] == carac) {
        vainqueur = true;
      }
      j += 3;
    }
    if ((this._cases[0] == carac &&
            this._cases[4] == carac &&
            this._cases[8] == carac) ||
        (this._cases[2] == carac &&
            this._cases[4] == carac &&
            this._cases[6] == carac)) {
      vainqueur = true;
    }
    return vainqueur;
  }

  void resetPlateau() {
    this._cases = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  }
}
