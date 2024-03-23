import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_progra_movil/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/silpancho-background-homepage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'RUTA GOURMET',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Card(
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
                    alignment: Alignment
                        .center, // Alinea el contenido al centro del contenedor
                    decoration: BoxDecoration(
                      color: Color.fromARGB(97, 89, 206, 143),
                    ),
                    child: FittedBox(
                      fit: BoxFit
                          .cover, // Hace que el texto ocupe todo el espacio disponible
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Bienvenido a RutaGourmet',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contaseña',
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción de inicio de sesión
                    },
                    child: Text('Log in'),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      // Acción de olvidar contraseña
                    },
                    child: Text('Forgot Password?'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text('Eres nuevo? regístrate'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
