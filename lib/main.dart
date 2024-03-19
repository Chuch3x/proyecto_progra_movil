import 'package:flutter/material.dart';
import 'package:proyecto_progra_movil/home-page.dart';

//custom MENU icon
const IconData menu = IconData(0xe3dc, fontFamily: 'MaterialIcons');

void main() {
  runApp(const MyApp());
}

ThemeData defaultTheme = ThemeData(
    // fontFamily: 'Pangolin',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromRGBO(89, 206, 143, 1),
      brightness: Brightness.dark,
    ),
    primaryColor: Colors.lightGreenAccent,
    appBarTheme: AppBarTheme(
        color: Color.fromRGBO(89, 206, 143, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
        displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    )));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}