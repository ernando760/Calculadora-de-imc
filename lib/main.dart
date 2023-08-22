import 'package:calculadora_de_imc/app.dart';
import 'package:calculadora_de_imc/src/controllers/imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ImcController(),
    child: const App(),
  ));
}
