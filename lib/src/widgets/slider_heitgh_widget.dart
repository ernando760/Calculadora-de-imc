import 'package:calculadora_de_imc/src/controllers/imc_controller.dart';
import 'package:calculadora_de_imc/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderHeightWidget extends StatefulWidget {
  const SliderHeightWidget({
    super.key,
  });
  @override
  State<SliderHeightWidget> createState() => _SliderHeightWidgetState();
}

class _SliderHeightWidgetState extends State<SliderHeightWidget> {
  @override
  Widget build(BuildContext context) {
    final homecontroller = context.watch<ImcController>();
    return ChangeNotifierProvider.value(
      value: homecontroller,
      builder: (context, child) {
        return Slider(
            value: homecontroller.height,
            onChanged: (value) {
              homecontroller.changeHeight(value);
            },
            min: 120,
            max: 220,
            activeColor: context.primary,
            inactiveColor: Colors.red[200],
            thumbColor: Colors.red);
      },
    );
  }
}
