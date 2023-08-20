import 'package:calculadora_de_imc/src/controllers/home_controller.dart';
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
            color: genreSelected == genre ? Colors.white : Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: genreSelected == genre
                      ? Colors.redAccent
                      : Colors.transparent)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genre.icon,
              size: 50,
              color: genreSelected == genre ? Colors.redAccent : Colors.grey,
            ),
            Text(
              genre.textGenre,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: genreSelected == genre ? Colors.redAccent : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
