import 'package:flutter/material.dart';
import 'package:luxe/helpers/alert.dart';
import 'package:luxe/models/container.dart';
import 'package:luxe/providers/container_profile_provider.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class listaContenedor extends StatefulWidget {
  listaContenedor({Key? key}) : super(key: key);

  @override
  State<listaContenedor> createState() => _listaContenedorState();
}

class _listaContenedorState extends State<listaContenedor> {
  @override
  Widget build(BuildContext context) {
    final contenedorProvider = Provider.of<ContenedorProvider>(context);
    final List<dynamic> listaContenedores = contenedorProvider.listaContenedor;

    final String name = ModalRoute.of(context)!.settings.arguments as String;

    print(contenedorProvider.listaContenedor);
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
      body: Container(
        child: ListView.builder(
          itemCount: listaContenedores.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 50),
                width: double.infinity,
                height: 100,
                decoration: _cardBorders(),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      color: Colors.blue,
                      child: ListTile(
                          onTap: () {
                            escogerContenedor(
                                name, listaContenedores[index]['_id'], context);
                          },
                          title: Text(listaContenedores[index]['name']),
                          // subtitle: Text(listaContenedores[index]['rental']),
                          leading: const Icon(Icons.card_giftcard)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, 27), blurRadius: 10),
        ]);

class Title extends StatelessWidget {
  //final UserProfileResponse userProfile;
  const Title({
    Key? key, //required this.userProfile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 185, 28),
                    fontSize: 25),
              ),
              Container(
                height: 20,
              ),
              Text('Aquí tienes lista los ',
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(color: Colors.black, fontSize: 18, height: 2)),
              Text(' contenedores disponibles.',
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(color: Colors.black, fontSize: 18, height: 2)),
            ],
          ),
        ],
      ),
    );
  }
}

void escogerContenedor(String name, String id, BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      });
  try {
    var url = Uri.https('luxe-api-rest-production-e0e0.up.railway.app',
        '/api/containers/assign/$id');

    var response = await http
        .put(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-token': Preferences.token,
            },
            body: convert.jsonEncode(<String, dynamic>{
              "name_by_user": name,
            }))
        .timeout(const Duration(seconds: 90));

    await Provider.of<UserProfileProvider>(context, listen: false)
        .getUserProfile(context);
   showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_alt,
                  color: Colors.greenAccent[400]!,
                  size: 110,
                ),
                const SizedBox(height: 30),
                Text(
                  'Has adquirido el contenedor, ya puedes registrar objetos',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
                )
              ],
            ),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      child: const Text('Ok',
                          style: TextStyle(fontSize: 18, color: Colors.indigo)),
                      onPressed: () =>  Navigator.pushNamed(context, 'principal')),
                ],
              )
            ],
          ));
   
  } catch (Error) {
    print(Error);
    print('http error');
  }
}
