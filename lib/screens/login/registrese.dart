// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
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
  bool _isVisible = true;
  final txtNombre = TextEditingController();
  final txtCorreo = TextEditingController();
  final txtContra = TextEditingController();
  final txtConfir_Contra = TextEditingController();

  String name = '';
  String email = '';
  String password = '';

  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

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
                    obscureText: !_isVisible,
                    onChanged: (password) => onPasswordChanged(password),
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? Icon(
                                  Icons.visibility,
                                  color: Color.fromARGB(255, 117, 117, 117),
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                        labelStyle: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                            color: Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(247, 248, 249, 1)),
                    controller: txtContra,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese su contraseña';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _isPasswordEightCharacters
                                ? Colors.green
                                : Colors.transparent,
                            border: _isPasswordEightCharacters
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Contiene al menos 8 caracteres")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _hasPasswordOneNumber
                                ? Colors.green
                                : Colors.transparent,
                            border: _hasPasswordOneNumber
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Contiene al menos 1 número")
                    ],
                  ),
                  SizedBox(
                    height: 50,
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ))),
                        onPressed: () {
                          print('======================');
                          print('iniciando la petición');
                          print('======================');
                          final bool isValid =
                              EmailValidator.validate(txtCorreo.text.trim());

                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Validando...')));
                              if (txtContra.text != txtConfir_Contra.text ||
                                  txtContra.text.length < 8) {
                                return displayGoodAlert(
                                    context: context,
                                    icon: Icons.sentiment_dissatisfied,
                                    message: 'Verifique la contraseña',
                                    color: Colors.yellow[700]!);
                              }

                              if (isValid) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Correo validado')));
                                name = txtNombre.text;
                                email = txtCorreo.text;
                                password = txtContra.text;
                                registrar(name, email, password, context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Inicie Sesión')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Ingrese un correo valido')));
                            }
                          }
                        }),
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


