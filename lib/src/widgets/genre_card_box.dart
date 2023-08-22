import 'package:calculadora_de_imc/src/controllers/imc_controller.dart';
import 'package:calculadora_de_imc/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class GenreCardBox extends StatelessWidget {
  const GenreCardBox(
      {super.key,
      required this.genre,
      required this.genreSelected,
      this.onTap});
  final Genre genreSelected;
  final Genre genre;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: genreSelected == genre
                ? context.primaryContainer
                : context.secondaryContainer,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: genreSelected == genre
                      ? context.primary
                      : Colors.transparent)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genre.icon,
              size: 50,
              color:
                  genreSelected == genre ? context.primary : context.secondary,
            ),
            Text(
              genre.textGenre,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: genreSelected == genre
                    ? context.primary
                    : context.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
