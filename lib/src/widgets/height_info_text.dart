import 'package:calculadora_de_imc/src/controllers/imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightInfoText extends StatelessWidget {
  const HeightInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<ImcController>();
    return ChangeNotifierProvider.value(
      value: homeController,
      builder: (context, child) {
        return Text.rich(TextSpan(
            text: homeController.height.ceil().toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            children: const [
              TextSpan(
                  text: "cm",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal))
            ]));
      },
    );
  }
}
