import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usescases/login.dart';
part 'user_event.dart';
part 'user_state.dart';

const String LOGIN_FAILED = 'Account does not exist';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Login login
  ;
  UserBloc({required this.login}) : super(Empty()) {
    on<UserEvent>((event, emit) => _callUseCase(event, emit));
  }
  _callUseCase(UserEvent event, Emitter<UserState> emit)  {
    emit(Empty());
    if (event is LoginEvent) {
      if (login(event.user, event.password)) {
        emit(LoginSuccessful());
      } else {
        emit(LoginFailed(message: LOGIN_FAILED));
      }
    }
  }
}
