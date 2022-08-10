import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {

  final List<GestureDetector> gifImages;
  final ScrollController scrollController;
  const GridWidget({required this.gifImages, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GridView(
      controller: scrollController,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getColumnCount(context),
      ),
      children: gifImages,
    );
  }

  int getColumnCount(BuildContext context) {
    double minTileWidth = 250;
    double availableWidth = MediaQuery.of(context).size.width;
    int i = availableWidth ~/ minTileWidth;
    return i;
  }

}
