import 'package:flutter/widgets.dart';

class LoginState {
  LoginState();
}

class LoginWaiting extends LoginState {
  dynamic userController = TextEditingController();
  dynamic passwordController = TextEditingController();

  LoginWaiting({required this.passwordController, this.userController});

  @override
  List<Object> get props => [userController, passwordController];
}

class LoginSuccesful extends LoginState {
  dynamic userController = TextEditingController();
  dynamic passwordController = TextEditingController();

  LoginSuccesful({required this.passwordController, this.userController});

  @override
  List<Object> get props => [userController, passwordController];
}

class LoginFailed extends LoginState {}

class LoginForgotten extends LoginState {}
