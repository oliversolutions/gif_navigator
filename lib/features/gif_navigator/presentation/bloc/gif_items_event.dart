part of 'gif_items_bloc.dart';

abstract class GifItemsEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetGifItemsEvent extends GifItemsEvent {
  final String query;
  final String pagination;
  GetGifItemsEvent(this.query, this.pagination);
  @override
  List<Object> get props => [query, pagination];
}
