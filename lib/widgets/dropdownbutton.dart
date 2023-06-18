import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButton();
}

final List<String> list = [
  '   Cardiologie',
  '   Chirurgie',
  '   Dentiste',
  '   Dermatologie',
  '   Génécologie',
  '   Hématolologie',
  '   Neurologie',
  '   Ophtamologie',
  '   ORL',
  '   Pédiatrie',
  '   Psychiatrie',
  '   Radiologie',
  '   Rhumatologie',
  '   Urologie',
  '   Médecine Générale'
];

class _DropDownButton extends State<DropDownButton> {
  static String? dropdownValue;
  final specialisationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      //BorderSide.color( Colors.transparent),
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        dropdownColor: primary,
        elevation: 16,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: primary,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: '   Spécialisation',
          hintStyle: TextStyle(
            color: Colors.grey[450],
          ),
        ),
        style: const TextStyle(color: Colors.grey),
        validator: (value) =>
            value == null ? "Selectionner une spécialité" : null,
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DataDropDownButton {
  static String? getValue = _DropDownButton.dropdownValue;
}
