class RegisterEvent {
  RegisterEvent();
}

class RegisterSave extends RegisterEvent {
  final String email;
  final String password;
  final String passwordValidation;

  RegisterSave(
      {required this.email,
      required this.password,
      required this.passwordValidation});

  @override
  List<Object> get props => [email, password, passwordValidation];
}
