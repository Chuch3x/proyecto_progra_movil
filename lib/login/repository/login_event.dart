import 'package:flutter/material.dart';

class LoginEvent {}

class LoginInput extends LoginEvent {
  final String user;
  final String email;

  LoginInput({required this.user, required this.email});

  @override
  List<Object> get props => [user, email];
}

class LoginFaceID extends LoginEvent {}

class LoginHuella extends LoginEvent {}
