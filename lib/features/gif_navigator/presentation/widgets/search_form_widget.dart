import 'package:flutter/material.dart';
import '../pages/gif_items_page.dart';

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({Key? key}) : super(key: key);

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
