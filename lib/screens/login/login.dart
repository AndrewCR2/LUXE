// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe/screens/login/olvide_contrase%C3%B1a.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();
  final txtNombre = TextEditingController();
  final txtApellido = TextEditingController();
  final txtContra = TextEditingController();
  final txtConfirCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Text(
                          '¡Olvidadaste la contraseña?',
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(106, 112, 124, 1)),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Olvide_Contra()));
                        },
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text(
                        'Clic',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(253, 197, 0, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ))),
                      onPressed: () {
                        Navigator.pushNamed(context, 'registrese');
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
