import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Olvide_Contra extends StatefulWidget {
  Olvide_Contra({Key? key}) : super(key: key);

  @override
  State<Olvide_Contra> createState() => _Olvide_ContraState();
}

class _Olvide_ContraState extends State<Olvide_Contra> {
  final _formKey = GlobalKey<FormState>();
  final txtCorreo = TextEditingController();
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
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '¿Has olvidado tu contraseña?',
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
                '¡No te preocupes!  Ingrese la dirección de correo electrónico vinculada con su cuenta.',
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
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          child: Text(
                            'Enviar codigo',
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
