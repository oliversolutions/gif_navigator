import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/gif_item.dart';
import '../../domain/usescases/get_gif_items.dart';
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
      List<GifItem> oldGifItems = [];
      if (super.state is Loaded) {
        var currentState = super.state as Loaded;
        oldGifItems = currentState.gifItems;
      }
      emit(Loading());
      final failureOrGifItems = await getGifItems(event.query, event.pagination);
      failureOrGifItems?.fold(
        (failure) => emit(Error(message: SERVER_FAILURE_MESSAGE)),
        (gifItems) => emit(Loaded(gifItems: oldGifItems + gifItems)),
      );
    }
  }
}
