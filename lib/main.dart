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
        initialRoute: 'splash',
        routes: {
          'splash': (_) => SplasScreen(),
          'inicio':(_)=>  AccReg(),
          'ruta_ingresar': (_) => Ingresar(),
          'login': (_) => Login_Page(),
          'registrese': (_) => Registro(),
          'olvide_contraseña': (_) => Olvide_Contra(),
          'verificacion': (_) => Verificacion(),
          'almacen':(_) => const AlmacenScreen() ,
        });
  }
}
