// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:luxe/screens/login/login.dart';
import 'package:luxe/screens/login/olvide_contrase%C3%B1a.dart';
import 'package:luxe/screens/login/registrese.dart';
import 'package:luxe/screens/login/verificacion.dart';

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
        initialRoute: 'login',
        routes: {
          'login': (_) => Login_Page(),
          'registrese': (_) => Registro(),
          'olvide_contraseña': (_) => Olvide_Contra(),
          'verificacion': (_) => Verificacion(),
        });
  }
}
