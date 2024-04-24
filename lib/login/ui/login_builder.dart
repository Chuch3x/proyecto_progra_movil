import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_progra_movil/login/bloc/login_bloc.dart';
import 'package:proyecto_progra_movil/login/bloc/login_event.dart';
import 'package:proyecto_progra_movil/login/bloc/login_state.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({super.key});

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

Widget LoginOnWait(emailController, passwordController, context) {
  return Card(
    color: const Color.fromARGB(255, 255, 255, 255),
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 89, 206, 144),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Bienvenido a RutaGourmet',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                ),
              ),
              const SizedBox(height: 10),
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
        ElevatedButton(
          onPressed: () {
            String username = emailController.text.toString();
            String password = passwordController.text.toString();
            if (username.isNotEmpty && password.isNotEmpty) {
              context
                  .read<LoginBloc>()
                  .add(LoginInput(email: username, password: password));
            }
          },
          child: const Text('Log in'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Olvidaste tu contraseña'),
        ),
        TextButton(
          onPressed: () {
            context.go("/register");
          },
          child: const Text('Eres nuevo registrate'),
        ),
      ],
    ),
  );
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        context.go("/mainPage");
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
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginWaiting) {
                return Column(
                  children: [
                    LoginOnWait(_emailController, _passwordController, context),
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
                return const AlertDialog(
                  title: Text("Login Fallido"),
                  content: Text("reintente ingresar sus datos"),
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
