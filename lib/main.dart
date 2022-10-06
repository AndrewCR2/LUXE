import 'package:flutter/material.dart';
import 'package:luxe/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Luxe',
        initialRoute: 'almacen',
        routes: {
          '/': (_) => Login_Page(),
          'almacen':(_) => AlmacenScreen() 
        });
  }
}
