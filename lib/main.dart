import 'package:flutter/material.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/screens/screens.dart';
import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProfileProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
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
          'splash': (_) => const SplasScreen(),
          'inicio':(_)=>  const AccReg(),
          'ruta_ingresar': (_) => const Ingresar(),
          'login': (_) => const Login_Page(),
          'registrese': (_) => Registro(),
          'olvide_contraseña': (_) => Olvide_Contra(),
          'verificacion': (_) => Verificacion(),
          'almacen':(_) =>  AlmacenScreen() ,
        });
  }
}
