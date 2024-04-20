import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proyecto_progra_movil/login/login_builder.dart';
import 'package:proyecto_progra_movil/login/login_cubit.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginScreenNew(),
    );
  }
}
