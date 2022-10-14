import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Form_items extends StatefulWidget {
  Form_items({Key? key}) : super(key: key);
  @override
  State<Form_items> createState() => Form_itemsState();
}

class Form_itemsState extends State<Form_items> {
  /* final _formKey = GlobalKey<FormState>(); */
  /* final txtCorreo = TextEditingController(); */
  File? imagen = null;
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
          child: Form(
              child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Registrar Productos:',
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromRGBO(0, 41, 107, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
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
                    labelText: "Código del producto",
                    labelStyle: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(131, 145, 161, 1),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(247, 248, 249, 1)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
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
                    labelText: "Nombre del Producto",
                    labelStyle: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(131, 145, 161, 1),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(247, 248, 249, 1)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese el nombre del producto';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
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
                    labelText: "Descripción del Producto",
                    labelStyle: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(131, 145, 161, 1),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(247, 248, 249, 1)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Es necesario que describa su producto';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        opciones(context);
                      },
                      child: Text(
                        'Subir Imagen',
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
                          Color.fromRGBO(0, 41, 107, 1),
                        ),
                      ),
                    ),
                    imagen != null ? Image.file(imagen!) : Center()
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text(
                    'Registrar',
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ))),
                  onPressed: () {
                    /* if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Inicie Sesión')));
                    } */
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
