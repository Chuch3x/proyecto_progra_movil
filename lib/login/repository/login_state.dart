import 'package:flutter/widgets.dart';

class LoginState {
  LoginState();
}

class LoginWaiting extends LoginState {
  dynamic emailController = TextEditingController();
  dynamic passwordController = TextEditingController();

  LoginWaiting({required this.passwordController, this.emailController});

  @override
  List<Object> get props => [emailController, passwordController];
}

class LoginSuccesful extends LoginState {
  dynamic emailController = TextEditingController();
  dynamic passwordController = TextEditingController();

  LoginSuccesful({required this.passwordController, this.emailController});

  @override
  List<Object> get props => [emailController, passwordController];
}

class LoginFailed extends LoginState {}

class LoginForgotten extends LoginState {}
