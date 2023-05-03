import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/text.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const SearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: placeholderText,
          hintStyle: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primary,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(28),
            ),
          ),
        ),
      ),
    );
  }
}
