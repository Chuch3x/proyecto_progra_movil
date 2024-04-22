import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_progra_movil/home-page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//custom MENU icon
const IconData menu = IconData(0xe3dc, fontFamily: 'MaterialIcons');

Future main() async {
  await dotenv.load(fileName: "env");
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      authDomain: dotenv.env['AUTH_DOMAIN']!,
      projectId: dotenv.env['PROJECT_ID']!,
      storageBucket: dotenv.env['STORAGE_BUCKET']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      appId: dotenv.env['APP_ID']!,
    ),
  );

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
