import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/login.dart';
import 'package:proyecto_progra_movil/register/register_cubit.dart';
import 'package:proyecto_progra_movil/register/register_state.dart';

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
      validator: (String? value) {
        return (value!.isEmpty) ? "Llene el nombre de usuario" : null;
      },
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
      validator: (String? value) {
        return (value!.isEmpty) ? "Ingrese una contraseña" : null;
      },
    );
  }

  Card _buildCardForms(formKey) {
    return Card(
      child: Form(
        key: formKey,
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
    final _formKey = GlobalKey<FormState>();

    void _navigate(BuildContext context, Widget page) {
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      });
    }

    return Container(
      decoration: _buildBackgroundDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeaderText(),
          BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
            if (state is RegisterWaiting) {
              return _buildCardForms(_formKey);
            } else if (state is RegisterSuccesful) {
              _navigate(context, LoginScreen());
              return const Text("REGISTRO EXITOSO");
            } else {
              _userController.clear();
              _emailController.clear();
              _passwordController.clear();
              _password2Controller.clear();
              return _buildCardForms(_formKey);
            }
          }),
          ElevatedButton(
            onPressed: () {
              final FormState form = _formKey.currentState!;
              if (form.validate()) {
                context.read<RegisterCubit>().passwordValidation(
                    _passwordController.text, _password2Controller.text);
              }
            },
            child: const Text("Registrarse tu usuario"),
          ),
        ],
      ),
    );
  }
}
