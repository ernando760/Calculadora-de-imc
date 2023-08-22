import 'package:calculadora_de_imc/src/widgets/imc_info_card_box.dart';
import 'package:flutter/material.dart';

class ImcInfoPage extends StatelessWidget {
  const ImcInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/");
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: const Text(
                "O seu imc é",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),

            const SizedBox(
              height: 20,
            ),
            const Expanded(flex: 3, child: ImcInfoCardBox()),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //     flex: 3,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(20),
            //           boxShadow: const [
            //             BoxShadow(blurRadius: 15, color: Colors.greenAccent)
            //           ]),
            //     ))
          ],
        ),
      ),
    );
  }
}
