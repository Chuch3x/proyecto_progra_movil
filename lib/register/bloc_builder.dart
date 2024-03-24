import 'dart:ffi';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  BoxDecoration _buildBackgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/silpancho-background-homepage.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeaderText() {
    return const Text(
      'RUTA GOURMET',
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
    );
  }

  TextFormField userValidation(final String textHint) {
    return TextFormField(
      controller: _userController,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: textHint,
      ),
    );
  }

  TextFormField mailValidation(final String textHint) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        icon: Icon(Icons.mail),
        labelText: textHint,
      ),
      validator: (String? value) {
        return (value != null && !value.contains('@'))
            ? 'Use the @ char.'
            : null;
      },
    );
  }

  TextFormField passwordValidation(final String textHint, final int type) {
    return TextFormField(
      controller: type == 0 ? _passwordController : _password2Controller,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: textHint,
      ),
      obscureText: true,
    );
  }

  Card _buildCardForms() {
    final _formKey = GlobalKey<FormState>();
    return Card(
      child: Form(
        key: _formKey,
        child: Column(children: <TextFormField>[
          mailValidation("Correo *"),
          userValidation("Nombre de Usuario *"),
          passwordValidation("Contraseña *", 0),
          passwordValidation("Repita la contraseña *", 1),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBackgroundDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeaderText(),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
