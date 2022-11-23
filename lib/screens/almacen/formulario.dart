import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../../helpers/alert.dart';

class Form_items extends StatefulWidget {
  Form_items({Key? key}) : super(key: key);
  @override
  State<Form_items> createState() => Form_itemsState();
}

class Form_itemsState extends State<Form_items> {
  final _formKey = GlobalKey<FormState>();

  final txtNombre = TextEditingController();
  final txtDesc = TextEditingController();
  String dropCurrentValue = '123';
  File? imagen;
  final picker = ImagePicker();
  Future selImagen(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No seleccionate ninguna foto');
      }
    });
    Navigator.of(context).pop();
  }

  Dio dio = Dio();

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    selImagen(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tomar una Foto',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 41, 107, 1),
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selImagen(2);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Seleccionar una Imagen',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 41, 107, 1),
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.image,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(253, 197, 0, 1)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Cancelar',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 41, 107, 1),
                                  letterSpacing: 1),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final List<ContainerElement> userContainers =
        userProfileProvider.containers;

    final List<DropdownMenuItem<String>> containers =
        List.generate(userContainers.length, (index) {
      final container = userContainers[index];
      return DropdownMenuItem(
        value: container.id,
        child: Text(container.nameByUser),
      );
    });

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registrar Productos:',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromRGBO(0, 41, 107, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //===================      NOMBRE     ===============================
                  TextFormField(
                    decoration: _inpuDecoration(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese el nombre del producto';
                      }
                    },
                    controller: txtNombre,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //===================     DESCRIPCIÓN     ===============================
                  TextFormField(
                    decoration: _inpuDecoration(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Es necesario que describa su producto';
                      }
                    },
                    controller: txtDesc,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //===================    SELECCIONAR CONTENEDOR    ===================================
                  const Text(
                    'Seleciona el Contenedor',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 41, 107, 1)),
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
                          items: [
                            const DropdownMenuItem(
                              value: '123',
                              child: Text('Contenedores', style: TextStyle(fontWeight: FontWeight.w500),),
                            ),
                            ...containers
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
                  //===================    SUBIR IMAGEN    ==========================
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            opciones(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.save_alt),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Subir Imagen',
                                style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(0, 41, 107, 1),
                            ),
                          ),
                        ),
                      ),
                      imagen != null ? Image.file(imagen!) : Center()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //====================    REGISTRAR     =====================
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      child: Text(
                        'Registrar',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              letterSpacing: 1),
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(253, 197, 0, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ))),
                      onPressed: () async {
                        if (txtNombre.text == '' ||
                            txtDesc.text == '' ||
                            imagen == null) {
                          return displayCustomAlert(
                              context: context,
                              icon: Icons.sentiment_dissatisfied,
                              message: 'Los campos son obligatorios',
                              color: Colors.yellow[700]!);
                        }

                        if (dropCurrentValue == '123') {
                          return displayCustomAlert(
                              context: context,
                              icon: Icons.sentiment_dissatisfied,
                              message: 'Elige un contenedor',
                              color: Colors.yellow[700]!);
                        }
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cargando...')));
                        }

                        try {
                          final url = Uri.https(
                              'luxe-api-rest-production-e0e0.up.railway.app',
                              '/api/items');
                          // final url = Uri.http(
                          //     'localhost:8080',
                          //     '/api/items');
                          final headers = <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                            'x-token': Preferences.token
                          };

                          final body = convert.jsonEncode(<String, String>{
                            'name': txtNombre.text,
                            'description': txtDesc.text,
                            'container': dropCurrentValue
                          });

                          final response = await http
                              .post(url, headers: headers, body: body)
                              .timeout(const Duration(seconds: 90));

                          print(response.body);
                          final jsonResponse = convert.jsonDecode(response.body)
                              as Map<String, dynamic>;

                          if (jsonResponse['name'] != null) {
                            print('El id del item es: ' + jsonResponse['_id']);
                            final idNewItem = jsonResponse['_id'];

                            await subir_imagen(
                                dio: dio, imagen: imagen!, id: idNewItem);
                            Provider.of<UserProfileProvider>(context,
                                    listen: false)
                                .getUserProfile(context);

                            displayCustomAlert(
                                context: context,
                                icon: Icons.task_alt,
                                message: 'Se ha guardado correctamente',
                                color: Colors.greenAccent[400]!);
                          }
                        } catch (error) {
                          print(error);
                          displayCustomAlert(
                              context: context,
                              icon: Icons.highlight_off,
                              message: 'El registro ha fallado',
                              color: Colors.red[400]!);
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  InputDecoration _inpuDecoration() {
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
                      labelText: "Descripción del Producto",
                      labelStyle: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(131, 145, 161, 1),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 248, 249, 1));
  }
}

Future<void> subir_imagen(
    {required Dio dio, required File imagen, required String id}) async {
  try {
    String filename = imagen.path.split('/').last;
    print('========================');
    print(filename);
    print('========================');

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imagen.path, filename: filename)
    });
    await dio
        .putUri(
            Uri.https('luxe-api-rest-production-e0e0.up.railway.app',
                '/api/uploads/items/' + id),
            data: formData)
        .then((value) {
      print(value);
    });
  } catch (e) {
    print(e.toString());
  }
}
