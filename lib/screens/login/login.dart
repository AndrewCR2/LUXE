// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _formKey = GlobalKey<FormState>();
  final txtAmpollaId = TextEditingController();
  final txtNombre = TextEditingController();
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
                  Text(
                    'Registrar Ampolla',
                    style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Colors.black,
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: txtAmpollaId,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 217, 219, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 217, 219, 1),
                          ),
                          borderRadius: BorderRadius.circular(5.5),
                        ), // Outline Input Border
                        icon: Icon(
                          Icons.numbers,
                          color: Color.fromRGBO(0, 217, 219, 1),
                        ),
                        labelText: "Ampolla ID",
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 217, 219, 1),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 236, 252, 253)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
