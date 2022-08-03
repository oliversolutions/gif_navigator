part of 'gif_items_bloc.dart';

abstract class GifItemsState extends Equatable {
  @override
  List<Object> get props => [];
}


class Empty extends GifItemsState {}

class Loading extends GifItemsState {}

class Loaded extends GifItemsState {
  final List<GifItem> gifItems;
  Loaded({required this.gifItems});
  List<Object> get props => [gifItems];
}

class Error extends GifItemsState {
  final String message;
  Error({required this.message});
  @override
  List<Object> get props => [message];
}
