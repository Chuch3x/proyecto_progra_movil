import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
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

  TextFormField _texValidation() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (value != null && value.contains('@'))
            ? 'Do not use the @ char.'
            : null;
      },
    );
  }

  Card _buildCardForms() {
    final _formKey = GlobalKey<FormState>();
    return Card(
      child: Form(
        key: _formKey,
        child: const Column(children: <TextFormField>[
          // Add TextFormFields and ElevatedButton here.
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
