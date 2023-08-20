import 'package:calculadora_de_imc/app.dart';
import 'package:calculadora_de_imc/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => HomeController(),
    child: const App(),
  ));
}
