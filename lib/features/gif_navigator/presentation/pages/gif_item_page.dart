import 'package:flutter/material.dart';

class GifItemPage extends StatelessWidget {
  final String url;

  const GifItemPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gif detail'),
      ),
      body: Container(child: Image.network(url)),
    );
  }
}
