import 'package:flutter/material.dart';
import '../widgets/search_form_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Gif navigator';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const SearchFormWidget(),
    );
  }
}

