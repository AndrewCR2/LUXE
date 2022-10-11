// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe/screens/login/olvide_contrase%C3%B1a.dart';

class Verificacion extends StatefulWidget {
  Verificacion({Key? key}) : super(key: key);

  @override
  State<Verificacion> createState() => _VerificacionState();
}

class _VerificacionState extends State<Verificacion> {
  final _formKey = GlobalKey<FormState>();
  final txtCorreo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Verificación',
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromRGBO(0, 41, 107, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ingrese el código de verificación que acabamos de enviar a su dirección de correo electrónico.',
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(
                    color: Color.fromRGBO(131, 145, 161, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(131, 145, 161, 1),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(253, 197, 0, 1),
                                      ))),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(131, 145, 161, 1),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(253, 197, 0, 1),
                                      ))),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(131, 145, 161, 1),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(253, 197, 0, 1),
                                      ))),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(131, 145, 161, 1),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(253, 197, 0, 1),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          child: Text(
                            'Verificar',
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
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Validando...')));
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿No recibiste el código? ',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(106, 112, 124, 1)),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Reenviar',
                              style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 41, 107, 1),
                                ),
                              ),
                            ),
                            onTap: () {},
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
