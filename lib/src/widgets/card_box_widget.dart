import 'package:flutter/material.dart';

class CardBoxWidget extends StatelessWidget {
  const CardBoxWidget(
      {super.key,
      required this.title,
      required this.value,
      this.add,
      this.remove});
  final String title;
  final String value;
  final void Function()? add;
  final void Function()? remove;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.redAccent, blurRadius: 10)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: Text(value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600))),
          Expanded(
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildButton(icon: Icons.remove, onPressed: remove),
                  _buildButton(
                    icon: Icons.add,
                    onPressed: add,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton({void Function()? onPressed, required IconData icon}) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.redAccent,
      constraints: const BoxConstraints(
          minWidth: 40, maxWidth: 60, minHeight: 40, maxHeight: 60),
      elevation: 1,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
