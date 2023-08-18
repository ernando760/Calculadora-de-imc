import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.amberAccent,
                )),
                Expanded(
                    child: Container(
                  color: Colors.redAccent,
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.amberAccent,
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.amberAccent,
                )),
                Expanded(
                    child: Container(
                  color: Colors.redAccent,
                )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
