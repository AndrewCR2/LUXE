// ignore_for_file: prefer_const_constructors
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/shared_preferences/preferences.dart';
import 'dart:convert' as convert;

import '../../helpers/alert.dart';

class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  bool obscuretext = true;
  final txtNombre = TextEditingController();
  final txtCorreo = TextEditingController();
  final txtContra = TextEditingController();
  final txtConfir_Contra = TextEditingController();

  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '¡Hola! Registrese para comenzar',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ), // Outline Input Border
                        labelText: "Nombre",
                        labelStyle: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1)),
                    controller: txtNombre,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese su nombre';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ), // Outline Input Border
                        labelText: "Correo",
                        labelStyle: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1)),
                    controller: txtCorreo,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese su correo';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ), // Outline Input Border
                        labelText: "Contraseña",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscuretext = !obscuretext;
                            });
                          },
                          child: Icon(obscuretext
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelStyle: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1)),
                    controller: txtContra,
                    obscureText: obscuretext,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese su contraseña';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(232, 236, 244, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ), // Outline Input Border
                        labelText: "Confirmar contraseña",
                        labelStyle: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1)),
                    controller: txtConfir_Contra,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor confirme su contraseña';
                      }
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      child: Text(
                        'Registrar',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                              letterSpacing: 1),
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(253, 197, 0, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Validando...')));
                          if (txtContra.text != txtConfir_Contra.text) {
                            return displayGoodAlert(
                                context: context,
                                icon: Icons.sentiment_dissatisfied,
                                message: 'Verifique la contraseña',
                                color: Colors.yellow[700]!);
                          }
                          name = txtNombre.text;
                          email = txtCorreo.text;
                          password = txtContra.text;
                          registrar(name, email, password, context);
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

void registrar(name, email, pass, BuildContext context) async {
  // print(name + email + pass);
  try {
    var url =
        Uri.https('luxe-api-rest-production-e0e0.up.railway.app', '/api/users');
    // Uri.https('luxe-api-rest-production.up.railway.app', '/api/users');
    https: //luxe-api-rest-production-e0e0.up.railway.app/

    var response = await http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: convert.jsonEncode(<String, String>{
              'name': name,
              'email': email,
              'password': pass
            }))
        .timeout(const Duration(seconds: 90));

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['msg'] == 'Te has registrado') {
      Preferences.token = jsonResponse['token']; // Guardamos el token
      Navigator.pushReplacementNamed(context, 'Elegir_plan');
    }
  } catch (Error) {
    print(Error);
    print('http error');
  }
}

/*ALERTA */


