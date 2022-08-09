part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends UserEvent {
  final String user;
  final String password;
  LoginEvent(this.user, this.password);
  @override
  List<Object> get props => [user, password];
}