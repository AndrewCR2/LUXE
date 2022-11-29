import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe/providers/container_provider.dart';
import 'package:luxe/widgets/menu.dart';

import 'package:provider/provider.dart';

class formContenedor extends StatefulWidget {
  formContenedor({Key? key}) : super(key: key);

  @override
  State<formContenedor> createState() => _formContenedorState();
}

class _formContenedorState extends State<formContenedor> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  final txtNom_Con = TextEditingController();

  final _lista = ['Pequeño  3x4m', 'Mediano  5x5m', 'Grande   8x5m'];
  String _vista = 'Seleccione una opcion';
  String name = '';
  String plan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: myMenu(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cómo será tu contenedor?',
                    style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(0, 41, 107, 1),
                    )),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 187, 189, 193),
                        ),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(232, 236, 244, 1),
                        ),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      labelText: "Nombra tu contenedor",
                      labelStyle: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(131, 145, 161, 1),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(247, 248, 249, 1)),
                  controller: txtNom_Con,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El contenedor necesita un nombre';
                    }
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Elige el tamaño de tu preferencia',
                    style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 12, 50, 106),
                    )),
                  ),
                ),
                const SizedBox(height: 20),
                _selectTamano(),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: 350,
                  height: 45,
                  child: ElevatedButton(
                    child: Text(
                      'Buscar Contenedores',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 10, 38, 159),
                            letterSpacing: 1),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ))),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Guardando...')));
                        name = txtNom_Con.text;
                        if (_vista == 'Pequeño  3x4m') {
                          plan = 'small';
                        }
                        if (_vista == 'Mediano  5x5m') {
                          plan = 'medium';
                        }
                        if (_vista == 'Grande   8x5m') {
                          plan = 'big';
                        }

                        final contenedorProvider =
                            Provider.of<ContenedorProvider>(context,
                                listen: false);
                        await contenedorProvider.buscarContainer(plan);
                        Navigator.pushReplacementNamed(
                            context, 'lista_contenedores',
                            arguments: name);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Asigna un nombre...')));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _selectTamano() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 300,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: DropdownButton(
        underline: Container(
            decoration:
                const BoxDecoration(border: Border(bottom: BorderSide.none))),
        iconEnabledColor: const Color.fromARGB(255, 67, 69, 70),
        items: _lista.map((String a) {
          return DropdownMenuItem(value: a, child: Text(a));
        }).toList(),
        onChanged: (_value) => {
          setState(() {
            _vista = _value.toString();
            //plan = _vista;
          })
        },
        hint: Text(_vista),
      ),
    );
  }
}
