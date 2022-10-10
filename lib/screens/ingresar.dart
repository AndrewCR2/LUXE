
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/screens/go_sign/google_sign.dart';
import 'dart:convert' as convert;

import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

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
    Firebase.initializeApp();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios_new),
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

                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bienvenido!',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromRGBO(0, 41, 107, 1),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 90),

                Center(
                  child: SingleChildScrollView(
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
                              textStyle: TextStyle(
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
                  child: SingleChildScrollView(
                    child: TextFormField(
                          autocorrect: false,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                            hintText: '*******',
                            labelText: 'Contraseña',
                            labelStyle: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(131, 145, 161, 1),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                            suffixIcon: GestureDetector(onTap: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                              ?Icons.visibility
                              : Icons.visibility_off ),
                            ),
                          ),
                          controller: txtPass,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Porfavor ingrese su contraseña';
                          }
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: InkWell(
                    child: const Text('Olvidaste la contraseña?',style: TextStyle(color: Colors.grey),),
                    onTap: (){
                      Navigator.pushNamed(context, 'olvide_contraseña');
                    },
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                child: GestureDetector(
                    onTap: (){
                      email = txtEmail.text;
                      password = txtPass.text;

                      ingresar(email, password, context);
                    },
                    child: Container(
                    child: const Center(child: Text('Acceder',style: TextStyle(color: Colors.white),)),
                    height: 60,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.amber
                    ),
                  ),
                  ),
              ),

              const SizedBox(height: 40),

              const Center(child: Text('O inicia sesion con',style: TextStyle(color: Colors.grey),)),

              const SizedBox(height: 15),

              Center(
                child: GestureDetector(
                  onTap: ()async{
                    User? user = await Authenticator.InitSign(
                      context: context);
                    print(user?.displayName);
                  },
                  child: Container(
                    height: 45,
                    width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(9),
                        image: const DecorationImage(image: AssetImage('assets/google.png'), fit: BoxFit.cover),
                      ),
                    ),
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta? ',
                    style: GoogleFonts.urbanist(
                      textStyle:const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(106, 112, 124, 1)),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Registrate ahora',
                      style: GoogleFonts.urbanist(
                        textStyle:const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'registrese');
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

void ingresar(email, pass, BuildContext context) async{

      try {
        
        var url = Uri.https('luxe-api-rest-production.up.railway.app', '/api/auth');

        var response = await http.post(url,
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body:convert.jsonEncode(<String, String>{
            'email': email,
            'password': pass
        })
        ).timeout(const Duration(seconds: 90));

        var jsonResponse =convert.jsonDecode(response.body) as Map<String, dynamic>;
        
        if (jsonResponse['msg'] == 'Bienvenido') {
          
          Preferences.token = jsonResponse['token']; // Guardamos el token
        
          Provider.of<UserProfileProvider>(context, listen: false).getUserProfile(context);
          Navigator.pushReplacementNamed(context, 'almacen');

        }else{
          print('Usuario incorrecto');
        }
      } catch (Error) {
        print(Error);
        print('http error');
      }
    }
