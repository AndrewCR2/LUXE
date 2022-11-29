import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CredContainer extends StatefulWidget {
  CredContainer({Key? key}) : super(key: key);

  @override
  State<CredContainer> createState() => _CredContainerState();
}

class  _CredContainerState extends State<CredContainer> {
  final _FormKey = GlobalKey<FormState>();
  bool obscuretext = true;
  final txtNombre = TextEditingController();
  final txtTipoCon = TextEditingController();
  final txtPrecio = TextEditingController();

  String name = '';
  String tipoCon = '';
  String precio = '';

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
              key: _FormKey,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Crear Contenedor',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    decoration: _inputDecoration("Nombre"),
                    controller: txtNombre,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese su nombre';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: _inputDecoration("Tipo Contenedor"),
                    controller: txtTipoCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese el tipo de contenedor';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration("Precio"),
                    controller: txtPrecio,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor Ingrese un precio';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                        child: Text(
                          'Crear',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                                letterSpacing: 1),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(253, 197, 0, 1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ))),

                        onPressed: () {
                          if (_FormKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Validando...'),
                              backgroundColor: Colors.amber,
                            ));
                          }

                          if (_FormKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Datos Validados'),
                                  backgroundColor: Colors.amber,));
                              name = txtNombre.text;
                              tipoCon = txtTipoCon.text;
                              precio = txtPrecio.text;
                              print(name);
                              print(tipoCon);
                              print(precio);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Ingrese los datos requeridos'),
                                          backgroundColor: Color.fromRGBO(0, 41, 107, 1),));
                            }
                        }),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(232, 236, 244, 1),
          ),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(232, 236, 244, 1),
          ),
          borderRadius: BorderRadius.circular(5.5),
        ), // Outline Input Border
        labelText: labelText,
        labelStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            color: Color.fromRGBO(131, 145, 161, 1),
          ),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(247, 248, 249, 1));
  }
}
