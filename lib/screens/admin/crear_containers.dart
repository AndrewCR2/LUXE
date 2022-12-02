import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe/config.dart';
import 'package:luxe/helpers/alert.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/providers/container_provider.dart';
import 'dart:convert' as convert;

import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

class CreateContainer extends StatefulWidget {
  CreateContainer({Key? key}) : super(key: key);

  @override
  State<CreateContainer> createState() => _CreateContainerState();
}

class _CreateContainerState extends State<CreateContainer> {
  final _FormKey = GlobalKey<FormState>();
  bool obscuretext = true;
  final txtNombre = TextEditingController();
  final txtTipoCon = TextEditingController();
  final txtPrecio = TextEditingController();
  String dropCurrentValue = '123';

  String name = '';
  String tipoCon = '';
  int precio = 0;

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
                  InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          items: const [
                            DropdownMenuItem(
                              value: '123',
                              child: Text(
                                'Tipo de Contenedor',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'small',
                              child: Text('Pequeño'),
                            ),
                            DropdownMenuItem(
                              value: 'medium',
                              child: Text('Mediano'),
                            ),
                            DropdownMenuItem(
                              value: 'big',
                              child: Text('Grande'),
                            ),
                          ],
                          value: dropCurrentValue,
                          onChanged: (String? valueIn) {
                            setState(() {
                              dropCurrentValue = valueIn!;
                            });
                          }),
                    ),
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
                          if (dropCurrentValue == '123') {
                            // ignore: void_checks
                            return displayCustomAlert(
                                context: context,
                                icon: Icons.sentiment_dissatisfied,
                                message: 'Elige un tipo de contenedor',
                                color: Colors.yellow[700]!);
                          }
                          if (_FormKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Validando...'),
                              backgroundColor: Colors.amber,
                            ));
                          }

                          if (_FormKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Datos Validados'),
                              backgroundColor: Colors.amber,
                            ));
                            name = txtNombre.text;
                            precio = int.parse(txtPrecio.text);
                            print(name);
                            print(dropCurrentValue);
                            print(precio);
                            crearContenedor(
                                name: name,
                                typeContainer: dropCurrentValue,
                                rental: precio,
                                context: context);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Ingrese los datos requeridos'),
                              backgroundColor: Color.fromRGBO(0, 41, 107, 1),
                            ));
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

void crearContenedor(
    {required String name,
    required String typeContainer,
    required int rental,
    required BuildContext context}) async {
      showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
  try {
    final url = Uri.https(ConfigLuxe.url, '/api/containers');
    final response = await http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-token': Preferences.token,
            },
            body: convert.jsonEncode(<String, dynamic>{
              "name": name,
              "type_container": typeContainer,
              "rental": rental
            }))
        .timeout(const Duration(seconds: 90));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['msg'] == 'Contenedor creado') {
      final msg = jsonResponse['msg'];
      await Provider.of<ContenedorProvider>(context, listen: false)
          .getContainers();

      displayCustomAlert(
          context: context,
          icon: Icons.task_alt_sharp,
          message: msg,
          color: Colors.greenAccent[400]!,
          redirectRoute: 'containers_screen');

    }
  } catch (err) {
    print(err);
  }
}
