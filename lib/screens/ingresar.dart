import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/config.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/screens/go_sign/google_sign.dart';
import 'dart:convert' as convert;

import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../providers/user_profile_provider.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({Key? key}) : super(key: key);

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final txtEmail = TextEditingController();
  final txtPass = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {Navigator.pushNamed(context, 'inicio')},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bienvenido!',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 20),
                            hintText: '',
                            labelText: 'Ingrese su correo',
                            labelStyle: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(131, 145, 161, 1),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9))),
                        controller: txtEmail,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Porfavor ingrese su correo';
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        autocorrect: false,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          hintText: '*******',
                          labelText: 'Contrase??a',
                          labelStyle: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(131, 145, 161, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromRGBO(0, 41, 107, 1),
                            ),
                          ),
                        ),
                        controller: txtPass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Porfavor ingrese su contrase??a';
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: InkWell(
                      child: const Text(
                        'Olvidaste la contrase??a?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'olvide_contrase??a');
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        email = txtEmail.text;
                        password = txtPass.text;

                        ingresar(email, password, context);
                      },
                      child: Container(
                        child: const Center(
                            child: Text(
                          'Acceder',
                          style: TextStyle(color: Colors.white),
                        )),
                        height: 60,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // const Center(
                  //     child: Text(
                  //   'O inicia sesion con',
                  //   style: TextStyle(color: Colors.grey),
                  // )),
                  // const SizedBox(height: 15),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () async {
                  //       User? user =
                  //           await Authenticator.InitSign(context: context);
                  //       print(user?.displayName);
                  //     },
                  //     child: Container(
                  //       height: 45,
                  //       width: 60,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey),
                  //         borderRadius: BorderRadius.circular(9),
                  //         image: const DecorationImage(
                  //             image: AssetImage('assets/google.png'),
                  //             fit: BoxFit.cover),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '??No tienes una cuenta? ',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(106, 112, 124, 1)),
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Registrate ahora',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 41, 107, 1),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'registrese');
                        },
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

void ingresar(email, pass, BuildContext context) async {
  try {
    var url = Uri.https(ConfigLuxe.url , '/api/auth');

    var response = await http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: convert
                .jsonEncode(<String, String>{'email': email, 'password': pass}))
        .timeout(const Duration(seconds: 90));
      print('=======================');
      print(response.body);
      print('=======================');

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['msg'] == 'Bienvenido') {
      Preferences.token = jsonResponse['token']; // Guardamos el token

      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });

      await Provider.of<UserProfileProvider>(context, listen: false)
          .getUserProfile(context);
      
      Navigator.pushNamed(context, 'principal');
    } else if(jsonResponse['msg'] == 'No tienes cuenta'){
      print('=======================');
      print(jsonResponse['msg']);
      print('=======================');
      Preferences.token = jsonResponse['token']; // Guardamos el token
      Navigator.pushNamed(context, 'Elegir_plan');
    }
    else {
      print('Usuario incorrecto');
      print(jsonResponse);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'LUX',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children:const [
                    Text(
                        'Email o contrase??a incorrecto, vuelve a verificar tu datos',
                        style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 39, 64, 176))),
                  child: const Text('Aceptar', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  } catch (Error) {
    print(Error);
    print('http error');
  }
}
