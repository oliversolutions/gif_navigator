import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {

  final List<Image> gifImages;
  const GridWidget({required this.gifImages});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: gifImages,
    );
  }
}
