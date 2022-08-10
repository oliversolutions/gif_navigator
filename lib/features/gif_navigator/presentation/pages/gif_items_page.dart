import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_navigator/features/gif_navigator/presentation/widgets/grid_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/gif_items_bloc.dart';
import '../widgets/loading_widget.dart';
import 'gif_item_page.dart';

class GifItemsPage extends StatefulWidget {
  static const String id = 'gif_items_page';
  final String query;

  const GifItemsPage({Key? key, required this.query}) : super(key: key);

  @override
  _GifItemsPage createState() => _GifItemsPage();
}

class _GifItemsPage extends State<GifItemsPage> {
  int pagination = 0;
  ScrollController scrollController = ScrollController();
  double scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gif list'),
        ),
        body: buildBody(context),
      );
  }

  BlocProvider<GifItemsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GifItemsBloc>(),
      child: BlocBuilder<GifItemsBloc, GifItemsState>(
        builder: (context, state) {
          if (state is Empty) {
            BlocProvider.of<GifItemsBloc>(context)
                .add(GetGifItemsEvent(widget.query, pagination.toString()));
            return LoadingWidget();
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              scrollController.jumpTo(scrollPosition);
            });
            List<GestureDetector> images = [];
            for (var element in state.gifItems) {
              images.add(GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GifItemPage(url: element.url),
                      ),
                    );
                  },
                  child: Image.network(element.url)));
            }
            return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollEndNotification &&
                      scrollController.position.extentAfter == 0) {
                    scrollPosition = scrollController.offset;
                    pagination += 1;
                    BlocProvider.of<GifItemsBloc>(context).add(
                        GetGifItemsEvent(widget.query, pagination.toString()));
                  }
                  return false;
                },
                child: GridWidget(gifImages: images, scrollController: scrollController));
          } else if (state is Error) {
            return Text(state.message);
          } else {
            return const Text('Error not found');
          }
        },
      ),
    );
  }
}