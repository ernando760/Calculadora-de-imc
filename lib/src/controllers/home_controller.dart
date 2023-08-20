import 'dart:developer';
import 'package:flutter/material.dart';

enum Genre {
  male(icon: Icons.male_outlined, textGenre: "Masculino"),
  famale(icon: Icons.female_outlined, textGenre: "Feminino");

  const Genre({required this.icon, required this.textGenre});

  final IconData icon;
  final String textGenre;
}

class HomeController extends ChangeNotifier {
  final Genre genreMale = Genre.male;
  final Genre genreFamale = Genre.famale;
  double height = 120;

  Genre genreCurrent = Genre.famale;

  int weight = 0;
  int age = 10;

  void changeGenre(Genre genre) {
    genreCurrent = genreCurrent != genre ? genre : genreCurrent;
    notifyListeners();
  }

  void changeValue(double newValue) {
    height = newValue;
    notifyListeners();
  }

  void changeWeight(int newWeight) {
    if (newWeight <= 0) {
      weight = 0;
    } else {
      weight = newWeight;
    }
    notifyListeners();
  }

  void changeAge(int newAge) {
    if (newAge <= 0) {
      age = 0;
    } else {
      age = newAge;
    }
    notifyListeners();
  }

  void calcImc() {
    final heightn = double.parse((height / 100).toStringAsFixed(2));
    final imc =
        double.parse(((weight / (heightn * heightn)).toStringAsFixed(2)));
    log("$weight / ($heightn * $heightn) = $imc", name: "imc");

    if (genreCurrent.textGenre == "Feminino") {
      if (age < 10 || age <= 19) {
        if (imc < 15.84) {
          log("baixo do peso");
        } else if (imc >= 15.84 && imc < 24.08) {
          log("Adequado ou Eutrófico");
        } else if (imc >= 24.08) {
          log("Sobrepeso");
        }
      } else if (age >= 20) {
        if (imc < 18.5) {
          log("baixo do peso");
        } else if (imc >= 18.5 && imc < 24.9) {
          log("peso normal");
        } else if (imc >= 25.0 && imc <= 29.9) {
          log("pre-obesidade");
        } else if (imc >= 30.0 && imc <= 34.9) {
          log("obesidade");
        }
      }
    } else if (genreCurrent.textGenre == "Masculino") {
      if (age < 10 || age <= 19) {
        if (imc < 16.38) {
          log("baixo do peso");
        } else if (imc >= 16.38 && imc < 23.03) {
          log("Adequado ou Eutrófico");
        } else if (imc >= 23.03) {
          log("Sobrepeso");
        }
      } else if (age >= 20) {
        if (imc < 18.5) {
          log("baixo do peso");
        } else if (imc >= 18.5 && imc < 24.9) {
          log("peso normal");
        } else if (imc >= 25.0 && imc <= 29.9) {
          log("pre-obesidade");
        } else if (imc >= 30.0 && imc <= 34.9) {
          log("obesidade");
        }
      }
    }
    notifyListeners();
  }
}
