part of 'gif_items_bloc.dart';

abstract class GifItemsEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetGifItemsEvent extends GifItemsEvent {
  final String query;
  GetGifItemsEvent(this.query);
  @override
  List<Object> get props => [query];
}
