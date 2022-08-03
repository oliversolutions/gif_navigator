import 'package:flutter/material.dart';
import 'package:gif_navigator/features/gif_navigator/presentation/pages/GifItemsPage.dart';

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
      body: const SearchForm(),
    );
  }
}

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GifItemsPage(query: value),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Search term cannot be empty'),
                ));
              }
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a search term'),
          ),
        ),
      ],
    );
  }
}
