import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_navigator/features/gif_navigator/presentation/widgets/GridWidget.dart';
import '../../../../injection_container.dart';
import '../bloc/gif_items_bloc.dart';
import '../widgets/LoadingWidget.dart';

class GifItemsPage extends StatelessWidget {
  static const String id = 'gif_items_page';
  final String query;

  const GifItemsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gif Pages'),
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
                BlocProvider.of<GifItemsBloc>(context).add(GetGifItemsEvent(query));
                return LoadingWidget();
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                List<Image> images = [];
                for (var element in state.gifItems) {
                  images.add(Image.network(element.url));
                }
                return GridWidget(gifImages: images);
              } else if(state is Error) {
                return Text(state.message);
              } else {
                return const Text('Error not found');
              }
            },
          ),
        ],
      ),
    );
  }
}