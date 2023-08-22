import 'package:calculadora_de_imc/src/screens/home_page.dart';
import 'package:calculadora_de_imc/src/screens/imc_info_page.dart';
import 'package:calculadora_de_imc/src/theme/theme_app.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeLight,
      darkTheme: ThemeApp.themeDark,
      themeMode: ThemeMode.system,
      title: "Calculadora de IMC",
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "imcInfo": (context) => const ImcInfoPage()
      },
    );
  }
}
