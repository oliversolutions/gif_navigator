import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {

  final List<Image> gifImages;
  const GridWidget({required this.gifImages});

  @override
  Widget build(BuildContext context) {
    return GridView(
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
