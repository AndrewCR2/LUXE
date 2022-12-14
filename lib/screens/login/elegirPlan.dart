import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/config.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/screens/success_screen.dart';
import 'dart:convert' as convert;

import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

class ElegirPlan extends StatefulWidget {
  ElegirPlan({Key? key}) : super(key: key);

  @override
  State<ElegirPlan> createState() => _ElegirPlan();
}

class _ElegirPlan extends State<ElegirPlan> {
  final _formKey = GlobalKey<FormState>();
  bool obscuretext = true;

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
                padding: const EdgeInsets.all(10.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elija su plan:',
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color.fromRGBO(0, 41, 107, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //Planes
                      Container(
                        height: 200,
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                planes('Mensual', 600, context);
                              },
                              child: MasPlanes('assets/contenedor.JPG', 'Plan',
                                  'Mensual', 600),
                            ),
                            GestureDetector(
                              onTap: () {
                                planes('Trimestral', 1100, context);
                              },
                              child: MasPlanes('assets/contenedor.JPG', 'Plan',
                                  'x3Meses', 1100),
                            ),
                            GestureDetector(
                              onTap: () {
                                planes('Anual', 10000, context);
                              },
                              child: MasPlanes(
                                  'assets/camion.JPG', 'Plan', 'Anual', 10000),
                            ),
                          ],
                        ),
                      ),
                      //planes finish
                    ])))));
  }
}

//Planes
Widget MasPlanes(String imagen, String name, String subname, int precio) {
  var textStyle = const TextStyle(
      color: Color.fromRGBO(0, 41, 107, 1),
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto-Italic');
  return Container(
    margin: EdgeInsets.only(right: 15),
    width: 140,
    decoration: BoxDecoration(
        color: Colors.white,
        //  color: Color.fromARGB(255, 230, 253, 255),
        border: Border.all(color: Color.fromRGBO(0, 41, 107, 1)),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            imagen,
            height: 100,
            width: 100,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text(
                  name,
                  style: textStyle,
                ),
                SizedBox(height: 10),
                Text(
                  subname,
                  style: textStyle,
                ),
                SizedBox(height: 10),
                Text(
                  '\$' + precio.toString(),
                  style: textStyle,
                ),
              ],
            )),
      ],
    ),
  );
}

void planes(String subname, int precio, BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
  try {
    var url = Uri.https( ConfigLuxe.url, '/api/account');

    var response = await http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-token': Preferences.token,
            },
            body: convert.jsonEncode(<String, dynamic>{
              "registration_date": DateTime.now().millisecondsSinceEpoch,
              "plan": subname,
              "rental_price": precio,
            }))
        .timeout(const Duration(seconds: 90));

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['msg'] == 'create account') {
      await Provider.of<UserProfileProvider>(context, listen: false)
          .getUserProfile(context); // Guardamos el token
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SuccessScreen()));
    } else {
      print(response.body);
    }
  } catch (Error) {
    print(Error);
    print('http error');
  }
}
