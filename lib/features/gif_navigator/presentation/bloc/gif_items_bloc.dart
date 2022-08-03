import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/GifItem.dart';
import '../../domain/usescases/GetGifItems.dart';

part 'gif_items_event.dart';

part 'gif_items_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class GifItemsBloc extends Bloc<GifItemsEvent, GifItemsState> {
  final GetGifItems getGifItems;

  GifItemsBloc({required this.getGifItems}) : super(Empty()) {
    on<GifItemsEvent>((event, emit) => _callUseCase(event, emit));
  }

  _callUseCase(GifItemsEvent event, Emitter<GifItemsState> emit) async {
    if (event is GetGifItemsEvent) {
      emit(Loading());
      final failureOrGifItems = await getGifItems(event.query);
      failureOrGifItems?.fold(
        (failure) => emit(Error(message: SERVER_FAILURE_MESSAGE)),
        (gifItems) => emit(Loaded(gifItems: gifItems)),
      );
    }
  }
}
