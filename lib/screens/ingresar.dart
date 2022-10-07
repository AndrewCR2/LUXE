import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({Key? key}) : super(key: key);

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final txtCorreo = TextEditingController();
  final txtPass = TextEditingController();
  final txtUser = TextEditingController();

  String email = '';
  String password = '';
  String user = '';

  @override
  Widget build(BuildContext context) {
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
                      controller: txtCorreo,
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
                              textStyle: TextStyle(
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
                      if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Validando...')));
                          Navigator.pushNamed(context, 'registrese');
                      }
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
                child: Container(
                  height: 45,
                  width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(9),
                      image: const DecorationImage(image: AssetImage('assets/google.png'), fit: BoxFit.cover)
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
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(106, 112, 124, 1)),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Registrate ahora',
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
            )),
          ),
        ),

        

        );
  }
}
