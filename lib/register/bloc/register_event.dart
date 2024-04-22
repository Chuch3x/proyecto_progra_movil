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

class RegisterChange extends RegisterEvent {}

class RegisterRestaurant extends RegisterEvent {
  final String email;
  final String password;
  final String passwordValidation;
  final String restaurantName;
  final String streetName;
  final String description;

  RegisterRestaurant(
      {required this.email,
      required this.password,
      required this.passwordValidation,
      required this.restaurantName,
      required this.description,
      required this.streetName});

  @override
  List<Object> get props => [
        email,
        password,
        passwordValidation,
        restaurantName,
        description,
        streetName
      ];
}
