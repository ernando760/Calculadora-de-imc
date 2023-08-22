import 'dart:developer';
import 'package:flutter/material.dart';

enum Genre {
  male(icon: Icons.male_outlined, textGenre: "Masculino"),
  famale(icon: Icons.female_outlined, textGenre: "Feminino");

  const Genre({required this.icon, required this.textGenre});

  final IconData icon;
  final String textGenre;
}

enum ImcStatus {
  pesoAbaixo(
      status: "Abaixo do peso",
      color: Colors.blueAccent,
      description: "Você está abaixo do peso."),
  pesoNormal(
      status: "Peso normal",
      color: Colors.greenAccent,
      description: "Você está com peso normal."),
  sobrePeso(
      status: "Sobre peso",
      color: Colors.yellowAccent,
      description: "Você está com sobre peso"),
  obesidade(
      status: "obesidade", color: Colors.red, description: "Você está obeso.");

  const ImcStatus(
      {required this.status, required this.color, required this.description});

  final String status;
  final String description;
  final Color color;
}

class ImcController extends ChangeNotifier {
  final Genre genreMale = Genre.male;
  final Genre genreFamale = Genre.famale;
  Genre _genreCurrent = Genre.male;

  double _height = 120;
  double _imc = 0;
  ImcStatus? imcStatus;

  Genre get genreCurrent => _genreCurrent;
  double get height => _height;
  double get imc => _imc;
  int get weight => _weight;
  int get age => _age;

  int _weight = 25;
  int _age = 10;

  void changeGenre(Genre genre) {
    _genreCurrent = _genreCurrent != genre ? genre : _genreCurrent;
    notifyListeners();
  }

  void changeHeight(double newValue) {
    _height = newValue;
    notifyListeners();
  }

  void changeWeight(int newWeight) {
    if (newWeight <= 0) {
      _weight = 0;
    } else {
      _weight = newWeight;
    }
    notifyListeners();
  }

  void changeAge(int newAge) {
    if (newAge <= 0) {
      _age = 0;
    } else {
      _age = newAge;
    }
    notifyListeners();
  }

  void calcImc() {
    final heightn = double.parse((_height / 100).toStringAsFixed(2));
    _imc = double.parse(((_weight / (heightn * heightn)).toStringAsFixed(2)));
    log("$_weight / ($heightn * $heightn) = $_imc", name: "imc");
    imcStatus = _checkTableImc(_genreCurrent);
    notifyListeners();
  }

  ImcStatus _checkTableImc(Genre genre) {
    switch (genre) {
      case Genre.male:
        switch (_age) {
          case >= 10 && <= 19:
            if (_imc < 16.38) {
              return ImcStatus.pesoAbaixo;
            } else if (_imc >= 16.38 && _imc < 23.03) {
              return ImcStatus.pesoNormal;
            } else if (_imc >= 23.03) {
              return ImcStatus.sobrePeso;
            }

          case >= 20:
            if (_imc < 18.5) {
              return ImcStatus.pesoAbaixo;
            } else if (_imc >= 18.5 && _imc < 24.9) {
              return ImcStatus.pesoNormal;
            } else if (_imc >= 25.0 && _imc <= 29.9) {
              return ImcStatus.sobrePeso;
            } else if (_imc >= 30.0 && _imc <= 34.9) {
              return ImcStatus.obesidade;
            }
            break;
        }
        return ImcStatus.obesidade;
      case Genre.famale:
        switch (_age) {
          case >= 10 && <= 19:
            if (_imc < 15.84) {
              return ImcStatus.pesoAbaixo;
            } else if (_imc >= 15.84 && _imc < 24.08) {
              return ImcStatus.pesoNormal;
            } else if (_imc >= 24.08) {
              return ImcStatus.sobrePeso;
            }
            break;
          case >= 20:
            if (_imc < 18.5) {
              return ImcStatus.pesoAbaixo;
            } else if (_imc >= 18.5 && _imc < 24.9) {
              return ImcStatus.pesoNormal;
            } else if (_imc >= 25.0 && _imc <= 29.9) {
              return ImcStatus.sobrePeso;
            } else if (_imc >= 30.0 && _imc <= 34.9) {
              return ImcStatus.obesidade;
            }
            break;
        }
        return ImcStatus.obesidade;
    }
  }
}
