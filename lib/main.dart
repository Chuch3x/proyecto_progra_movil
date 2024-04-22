import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_progra_movil/home-page.dart';

//custom MENU icon
const IconData menu = IconData(0xe3dc, fontFamily: 'MaterialIcons');

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCp2H-wqVIhA3QvOMiavui9TDy4MAaI8zE",
            authDomain: "flutter-firebase-project-b39c6.firebaseapp.com",
            projectId: "flutter-firebase-project-b39c6",
            storageBucket: "flutter-firebase-project-b39c6.appspot.com",
            messagingSenderId: "732543311140",
            appId: "1:732543311140:web:65e0b19a89a0c12fe627b1"));
  }
  runApp(const MyApp());
}

ThemeData defaultTheme = ThemeData(
    // fontFamily: 'Pangolin',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(89, 206, 143, 1),
      brightness: Brightness.light,
    ),
    primaryColor: Colors.lightGreenAccent,
    appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(89, 206, 143, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
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
