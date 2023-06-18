import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';

class ButtonField extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonField({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade200,
          //minimumSize: Size.fromHeight(50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: buildContent(),
        onPressed: onClicked,
      ),
    );
  }

  Widget buildContent() => Row(
        children: [
          Icon(icon, size: 25, color: primary),
          Text(
            text,
            style: TextStyle(color: Color.fromARGB(255, 116, 115, 115)),
          ),
        ],
      );
}
