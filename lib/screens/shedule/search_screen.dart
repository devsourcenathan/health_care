import 'package:flutter/material.dart';
import 'package:medical_project/widgets/my_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SearchBar(searchController: searchController)],
    );
  }
}
