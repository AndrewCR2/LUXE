import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contra_cambiada extends StatefulWidget {
  Contra_cambiada({Key? key}) : super(key: key);

  @override
  State<Contra_cambiada> createState() => Contra_cambiadaState();
}

class Contra_cambiadaState extends State<Contra_cambiada> {
  final _formKey = GlobalKey<FormState>();
  /* final txtCorreo = TextEditingController(); */
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
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/Successmark.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '¡Contraseña cambiada!',
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromRGBO(0, 41, 107, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tu contraseña ha sido cambiada exitosamente.',
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(
                    color: Color.fromRGBO(131, 145, 161, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 65,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      child: Text(
                        'Atrás para iniciar sesión',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                        Navigator.pushNamed(context, '');
                      },
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
