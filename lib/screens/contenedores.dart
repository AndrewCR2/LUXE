import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe/widgets/menu.dart';

class formContenedor extends StatefulWidget {
  formContenedor({Key? key}) : super(key: key);

  @override
  State<formContenedor> createState() => _formContenedorState();
}

class _formContenedorState extends State<formContenedor> {
  
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  final txtNom_Con = TextEditingController();
  final _precio = TextEditingController();


  var _lista = ['Pequeño  3x4m     S/80  x mes',
                'Mediano  5x5m     S/150 x mes',
                'Grande   8x5m     S/200 x mes'];
  String _vista = 'Seleccione una opcion';

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
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height:20
                ),
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
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'El contenedor necesita un nombre';
                      }
                    },
                ),
                SizedBox(
                  height: 45,
                ),

                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Text(
                    'Elige el tamaño y tu plan',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 12, 50, 106),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height:20
                ),

                _selectTamano(),

                SizedBox(
                  height: 70,
                ),

                Container(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      child: Text(
                        'Adquirir',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromARGB(255, 10, 38, 159),
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
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, 'pasarela_pago');
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
                //color: Colors.amber,
                width: 300,
                height: 54,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
                  
                ),
                child: DropdownButton(
                  iconEnabledColor: Colors.blue,
                  items: _lista.map((String a){
                    return DropdownMenuItem(
                      value: a,
                      child: Text (a));
                  }).toList(),
                  onChanged: (_value)=>{
                    setState((){
                      _vista = _value.toString();
                    })
                  },
                  hint: Text(_vista),
                  underline: Container(
                    height: 3,
                    color: Colors.blue,
                  ),

                ),
              );
  }

}