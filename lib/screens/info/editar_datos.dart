import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/widgets/menu.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../models/user_profile_response.dart';

class editarDatos extends StatefulWidget {
  editarDatos({Key? key}) : super(key: key);

  @override
  State<editarDatos> createState() => _editarDatosState();
}

class _editarDatosState extends State<editarDatos> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formkey = GlobalKey<FormState>();

  bool obscuretext = true;
  bool _isVisible = true;

  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  var numberMask = MaskTextInputFormatter(
      mask: '### ### ###', filter: {"#": RegExp(r'[0-9]')});
  var dniMask =
      MaskTextInputFormatter(mask: '########', filter: {"#": RegExp(r'[0-9]')});

  final txtNombre = TextEditingController();
  final txtDni = TextEditingController();
  final txtPhone = TextEditingController();
  final txtDireccion = TextEditingController();
  final txtRuc = TextEditingController();
  final txtPassword = TextEditingController();

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  String name = '';
  String phone = '';
  String direccion = '';
  String dni = '';
  String ruc = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    //final userProfileProvider = Provider.of<UserProfileProvider>(context);
    //final UserProfileResponse? usuario = userProfileProvider.user;
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
                    'Edita tu información',
                    style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(0, 41, 107, 1),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: _inputDecoration('Nombre', context),
                  controller: txtNombre,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [dniMask],
                  decoration: _inputDecoration('DNI', context),
                  controller: txtDni,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: _inputDecoration('dirección', context),
                  controller: txtDireccion,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  inputFormatters: [numberMask],
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration('Teléfono', context),
                  controller: txtPhone,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration('R.U.C', context),
                  controller: txtRuc,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: !_isVisible,
                  onChanged: (password) => onPasswordChanged(password),
                  decoration: InputDecoration(
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
                      labelText: "Contraseña",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? const Icon(
                                Icons.visibility,
                                color: Color.fromARGB(255, 117, 117, 117),
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      ),
                      labelStyle: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(131, 145, 161, 1),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(247, 248, 249, 1)),
                  controller: txtPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor Ingrese su contraseña';
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _isPasswordEightCharacters
                              ? Colors.green
                              : Colors.transparent,
                          border: _isPasswordEightCharacters
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contiene al menos 8 caracteres")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _hasPasswordOneNumber
                              ? Colors.green
                              : Colors.transparent,
                          border: _hasPasswordOneNumber
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contiene al menos 1 número")
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Vizualiza tus datos antes de editarlos',
                    style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 12, 50, 106),
                    )),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  height: 45,
                  child: ElevatedButton(
                      child: Text(
                        'ACEPTAR',
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
                              const SnackBar(content: Text('Validando...')));
                          name = txtNombre.text;
                          phone = txtPhone.text;
                          direccion = txtDireccion.text;
                          dni = txtDni.text;
                          ruc = txtRuc.text;
                          password = txtPassword.text;

                          _alertSuccess(name, phone, direccion, dni, ruc,
                              password, context);
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String user, BuildContext context) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 187, 189, 193),
          ),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(232, 236, 244, 1),
          ),
          borderRadius: BorderRadius.circular(5.5),
        ),
        labelText: user,
        labelStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            color: Color.fromRGBO(131, 145, 161, 1),
          ),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(247, 248, 249, 1));
  }
}

Future<dynamic> _alertSuccess(String name, String phone, String direccion,
    String dni, String ruc, String password, BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Text(
                        'Vizualiza tus datos antes de editarlos',
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 12, 50, 106),
                        )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'NOMBRE:',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 17, 16, 16)),
                    ),
                    const SizedBox(height: 10),
                    Text(name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 62, 131),
                        ))),
                    const SizedBox(height: 30),
                    const Text(
                      'DNI:',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 17, 16, 16)),
                    ),
                    const SizedBox(height: 10),
                    Text(dni,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 62, 131),
                        ))),
                    const SizedBox(height: 30),
                    const Text(
                      'DIRECCIÓN:',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 17, 16, 16)),
                    ),
                    const SizedBox(height: 10),
                    Text(direccion,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 62, 131),
                        ))),
                    const SizedBox(height: 30),
                    const Text(
                      'TELEFONO:',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 17, 16, 16)),
                    ),
                    const SizedBox(height: 10),
                    Text(phone,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 62, 131),
                        ))),
                    const SizedBox(height: 30),
                    const Text(
                      'RUC:',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 17, 16, 16)),
                    ),
                    const SizedBox(height: 10),
                    Text(ruc,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 62, 131),
                        ))),
                    const SizedBox(height: 30),
                    const Text(
                      'CONTRASEÑA:',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 17, 16, 16)),
                    ),
                    const SizedBox(height: 10),
                    Text(password,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 16, 62, 131),
                        )))
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextButton(
                        child: const Text('No son mis datos!',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 148, 28, 28))),
                        onPressed: () => {Navigator.of(context).pop()}),
                  ),
                  const SizedBox(width: 30),
                  Container(
                    child: TextButton(
                        child: const Text(
                          'Editar',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 27, 49, 172)),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, 'principal')),
                  ),
                ],
              )
            ],
          ));
}
