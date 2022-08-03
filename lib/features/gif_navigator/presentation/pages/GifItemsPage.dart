import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/GifItem.dart';
import '../bloc/gif_items_bloc.dart';

class GifItemsPage extends StatelessWidget {
  static const String id = 'gif_items_page';
  final String query;

  const GifItemsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gif Pages'),
        ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
      ),
    );
  }

  BlocProvider<GifItemsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GifItemsBloc>(),
      child: Column(
        children: <Widget> [
          BlocBuilder<GifItemsBloc, GifItemsState>(
            builder: (context, state) {
              if (state is Empty) {
                return GestureDetector(child: Text("Empty"),onTap: () {
                  BlocProvider.of<GifItemsBloc>(context).add(GetGifItemsEvent(this.query));
                });
              } else if (state is Loading) {
                return Text("Loading");
              } else if (state is Loaded) {
                List<GifItem> gifItems = state.gifItems;
                return GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: [
                    Image.network('https://picsum.photos/250?image=1'),
                    Image.network('https://picsum.photos/250?image=2'),
                    Image.network('https://picsum.photos/250?image=3'),
                    Image.network('https://picsum.photos/250?image=4'),
                  ],
                );
              } else {
                return Text("Not found");
              }
            },
          ),
        ],
      ),
    );
  }
}