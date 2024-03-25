import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'preferences_cubit.dart';

class Comida {
  final String nombre;
  final String imagenUrl;

  Comida({required this.nombre, required this.imagenUrl});
}

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final PreferencesCubit preferencesCubit = BlocProvider.of<PreferencesCubit>(context);
    
    final List<Comida> foodPreferences = [
      Comida(nombre: 'Italiana', imagenUrl: 'assets/images/opcion-italiana.jpg'),
      Comida(nombre: 'Mexicana', imagenUrl: 'assets/images/opcion-mexicana.jpg'),
      Comida(nombre: 'China', imagenUrl: 'assets/images/opcion-china.jpg'),
      Comida(nombre: 'Japonesa', imagenUrl: 'assets/images/opcion-japonesa.jpg'),
      Comida(nombre: 'Vegetariana', imagenUrl: 'assets/images/opcion-vegetariana.jpg'),
    ];

    return BlocProvider(
      create: (context) => PreferencesCubit(),
      child: MaterialApp(
        title: "Preferencias",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Selecciona tus preferencias de comida'),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos tarjetas por fila
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: foodPreferences.length,
            itemBuilder: (context, index) {
              final comida = foodPreferences[index];
              return GestureDetector(
                onTap: () {
                  preferencesCubit.selectPreference(comida.nombre);
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        comida.imagenUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        comida.nombre,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
