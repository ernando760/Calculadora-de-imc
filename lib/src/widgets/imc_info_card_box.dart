import 'package:calculadora_de_imc/src/controllers/imc_controller.dart';
import 'package:calculadora_de_imc/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImcInfoCardBox extends StatelessWidget {
  const ImcInfoCardBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ImcController>();
    return ChangeNotifierProvider<ImcController>.value(
        value: controller,
        builder: (context, _) {
          return Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: context.primaryContainer,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: controller.imcStatus != null
                          ? controller.imcStatus!.color
                          : Colors.transparent)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${controller.imc} kg/m²",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.imcStatus?.status ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )),
                Divider(
                  height: 3,
                  color: Colors.grey[300],
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Descrição:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            controller.imcStatus?.description ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
