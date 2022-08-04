import 'package:flutter/material.dart';
import '../widgets/SearchFormWidget.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome_page';

  const WelcomePage({Key? key}) : super(key: key);

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

