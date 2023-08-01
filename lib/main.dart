import 'package:flutter/material.dart';
import 'package:flutter_new/views/screens/firebase_todos_screen.dart';
import 'package:flutter_new/views/screens/home_screen.dart';
import 'package:flutter_new/views/screens/login_screen.dart';
import 'package:flutter_new/views/screens/signup_screen.dart';
import 'package:flutter_new/views/screens/todos_details_screen.dart';
import 'package:flutter_new/views/screens/todos_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/firebaseTodosScreen',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context)=> const HomeScreen(),
        '/todoDetailsScreen' : (context)=> const TodoDetailsScreen(),
        '/signUpScreen': (context)=> const SignUpScreen(),
        '/firebaseTodosScreen' : (context)=> const FirebaseTodosScreen(),
      },
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      //home: const LoginScreen(),
    );
  }
}


