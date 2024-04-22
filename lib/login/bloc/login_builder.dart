import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_progra_movil/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:proyecto_progra_movil/login/bloc/login_bloc.dart';
import 'package:proyecto_progra_movil/login/bloc/login_event.dart';
import 'package:proyecto_progra_movil/login/bloc/login_state.dart';
import 'package:proyecto_progra_movil/preferences/preferences_screen.dart';
import 'package:proyecto_progra_movil/register/bloc/bloc_provider.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({super.key});

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

Widget LoginOnWait(emailController, passwordController) {
  return Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(97, 89, 206, 143),
            ),
            child: const FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const Text(
            'Bienvenido a RutaGourmet',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Usuario',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
        ],
      ),
    ),
  );
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void navigate(BuildContext context, Widget page) {
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      });
    }

    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        // navigate(context, PreferencesPage());
      },
    );

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/silpancho-background-homepage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'RUTA GOURMET',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginWaiting) {
                return Column(
                  children: [
                    LoginOnWait(_emailController, _passwordController),
                    ElevatedButton(
                      onPressed: () {
                        String username = _emailController.text.toString();
                        String password = _passwordController.text.toString();
                        if (username.isNotEmpty && password.isNotEmpty) {
                          context.read<LoginBloc>().add(
                              LoginInput(email: username, password: password));
                        }
                      },
                      child: const Text('Log in'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Olvidaste tu contraseña'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Eres nuevo registrate'),
                    ),
                  ],
                );
              } else if (state is LoginSuccesful) {
                return AlertDialog(
                  title: const Text("Login Exitoso"),
                  content: Text("Bienvenido a Ruta Gourmet ${state.email}"),
                  actions: [
                    okButton,
                  ],
                );
              } else if (state is LoginFailed) {
                return AlertDialog(
                  title: const Text("Login Fallido"),
                  content: const Text("reintente ingresar sus datos"),
                  actions: [
                    okButton,
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    ));
  }
}