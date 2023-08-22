import 'package:calculadora_de_imc/src/controllers/imc_controller.dart';
import 'package:calculadora_de_imc/src/extensions/context_extension.dart';
import 'package:calculadora_de_imc/src/widgets/card_box_widget.dart';
import 'package:calculadora_de_imc/src/widgets/genre_card_box.dart';
import 'package:calculadora_de_imc/src/widgets/height_info_text.dart';
import 'package:calculadora_de_imc/src/widgets/slider_heitgh_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildTitle() {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: const Text(
        "Calculadora de IMC",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ));
  }

  Widget _buildGenreCardBoxs() {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Consumer<ImcController>(
            builder: (context, repo, _) {
              return GenreCardBox(
                onTap: () =>
                    context.read<ImcController>().changeGenre(Genre.male),
                genreSelected: repo.genreCurrent,
                genre: repo.genreMale,
              );
            },
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Consumer<ImcController>(builder: (context, repo, _) {
            return GenreCardBox(
              onTap: () =>
                  context.read<ImcController>().changeGenre(Genre.famale),
              genreSelected: repo.genreCurrent,
              genre: repo.genreFamale,
            );
          })),
        ],
      ),
    );
  }

  Widget _buildCardBoxsHeight() {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Consumer<ImcController>(builder: (context, repo, _) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.primaryContainer,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeightInfoText(),
                  SizedBox(
                    height: 10,
                  ),
                  SliderHeightWidget()
                ],
              ),
            );
          })),
        ],
      ),
    );
  }

  Widget _buildWeightAndAgeCarBoxs(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: ChangeNotifierProvider<ImcController>.value(
                  value: context.watch<ImcController>(),
                  builder: (context, _) {
                    return CardBoxWidget(
                      title: "Peso",
                      value: context.read<ImcController>().weight.toString(),
                      add: () => context.read<ImcController>().changeWeight(
                          context.read<ImcController>().weight + 1),
                      remove: () => context.read<ImcController>().changeWeight(
                          context.read<ImcController>().weight - 1),
                    );
                  })),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: ChangeNotifierProvider<ImcController>.value(
                  value: context.watch<ImcController>(),
                  builder: (context, _) {
                    return CardBoxWidget(
                      title: "Idade",
                      value: context.read<ImcController>().age.toString(),
                      add: () => context
                          .read<ImcController>()
                          .changeAge(context.read<ImcController>().age + 1),
                      remove: () => context
                          .read<ImcController>()
                          .changeAge(context.read<ImcController>().age - 1),
                    );
                  })),
        ],
      ),
    );
  }

  Widget _buildCalcButton() {
    return Expanded(
        child: SizedBox(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.redAccent[100],
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            context.read<ImcController>().calcImc();

            Navigator.pushReplacementNamed(context, "imcInfo");
          },
          child: const Text(
            "Calcular",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitle(),
            _buildGenreCardBoxs(),
            const SizedBox(
              height: 10,
            ),
            _buildCardBoxsHeight(),
            const SizedBox(
              height: 10,
            ),
            _buildWeightAndAgeCarBoxs(context),
            const SizedBox(
              height: 10,
            ),
            _buildCalcButton()
          ],
        ),
      )),
    );
  }
}
