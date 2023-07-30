import 'package:flutter/material.dart';
import 'package:flutter_new/views/screens/home_screen.dart';
import 'package:flutter_new/views/screens/login_screen.dart';
import 'package:flutter_new/views/screens/todos_details_screen.dart';
import 'package:flutter_new/views/screens/todos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const TodosScreen(),
        '/home': (context)=> const HomeScreen(),
        '/todoDetailsScreen' : (context)=> const TodoDetailsScreen(),
      },
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      //home: const LoginScreen(),
    );
  }
}


