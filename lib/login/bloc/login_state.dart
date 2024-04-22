import 'package:flutter/widgets.dart';

class LoginState {
  LoginState();
}

class LoginWaiting extends LoginState {}

class LoginSuccesful extends LoginState {
  String email;

  LoginSuccesful({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginFailed extends LoginState {}

class LoginForgotten extends LoginState {}
