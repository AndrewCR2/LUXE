import 'package:flutter/material.dart';
import 'package:luxe/screens/contenedores/form_contenedores.dart';
import 'package:luxe/screens/contenedores/lista_contenedores.dart';
import 'package:luxe/screens/login/elegirPlan.dart';
import 'package:luxe/screens/pasarela_pago.dart';
import 'package:luxe/screens/principal.dart';
import 'package:provider/provider.dart';
import 'package:luxe/shared_preferences/preferences.dart';
import 'package:luxe/providers/providers.dart';
import 'package:luxe/screens/screens.dart';

void main() async {
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
        ChangeNotifierProvider(
          create: (_) => UserProfileProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ContenedorProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ItemProvider(),
          lazy: false,
        ),
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
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'Luxe',
        initialRoute: 'splash',
        routes: {
          'splash': (_) => const SplasScreen(),
          'inicio': (_) => const AccReg(),
          'ruta_ingresar': (_) => const Ingresar(),
          'registrese': (_) => Registro(),
          'olvide_contraseña': (_) => Olvide_Contra(),
          'verificacion': (_) => Verificacion(),
          'almacen': (_) => const AlmacenScreen(),
          'cambiada': (_) => Contra_cambiada(),
          'formulario_items': (_) => Form_items(),
          'principal': (_) => Principal(),
          'Elegir_plan': (_) => ElegirPlan(),
          'form_contenedor': (_) => formContenedor(),
          'pasarela_pago': (_) => pasarelaPago(),
          'estado_cuenta': (_) => const EstadoCuentaScreen(),
          'lista_contenedores': (_) => listaContenedor(),
          'edit_item': (_) => EditItemScreen(),
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0
          )
        )
        );

  }
}
