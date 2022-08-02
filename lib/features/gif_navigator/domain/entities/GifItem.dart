import 'package:equatable/equatable.dart';

class GifItem extends Equatable {
  final String url;
  const GifItem({required this.url});
  @override
  List<Object> get props => [url];
}

