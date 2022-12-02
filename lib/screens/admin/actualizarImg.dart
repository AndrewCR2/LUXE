import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:luxe/config.dart';
import 'package:luxe/helpers/alert.dart';
import 'package:luxe/helpers/subir_archivo.dart';
import 'package:luxe/models/item_response.dart';
import 'package:luxe/providers/providers.dart';
import 'package:provider/provider.dart';

class ActualizarImgItem extends StatefulWidget {
  const ActualizarImgItem({Key? key}) : super(key: key);

  @override
  State<ActualizarImgItem> createState() => __ActualizarImgItemState();
}

class __ActualizarImgItemState extends State<ActualizarImgItem> {
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
    Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Actualizar Imagen",
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromRGBO(0, 41, 107, 1),
            ),
          ),
        ),
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
            child: Column(children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   child: Text(
              //     'Items',
              //     style: GoogleFonts.urbanist(
              //       textStyle: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20,
              //         color: Color.fromRGBO(0, 41, 107, 1),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Nombre: ',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 41, 107, 1),
                      ),
                    ),
                  ),
                  Text(
                    item.name,
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Descripción: ',
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(0, 41, 107, 1),
                      ),
                    ),
                  ),
                  Text(
                    item.description,
                    style: GoogleFonts.urbanist(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
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
                  imagen != null ? Image.file(imagen!) : Center(),
                  const SizedBox(height: 20,),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ))),
                        onPressed: () async {
                          try {
                            await subir_imagen(
                                dio: dio, imagen: imagen!, id: item.id, query: 'store');
                            Provider.of<ItemProvider>(context,
                                    listen: false).getItems();

                              displayCustomAlert(
                                  context: context,
                                  icon: Icons.task_alt,
                                  message: 'Se ha guardado correctamente',
                                  color: Colors.greenAccent[400]!,
                                  redirectRoute: 'items_screen'
                                );
                            
                          } catch (error) {
                            print(error);
                          }
                        }),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}


