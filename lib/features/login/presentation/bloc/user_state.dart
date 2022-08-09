part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends UserState {}

class LoginSuccessful extends UserState {}

class LoginFailed extends UserState {
  final String message;
  LoginFailed({required this.message});
  @override
  List<Object> get props => [message];
}
