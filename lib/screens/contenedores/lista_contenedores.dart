import 'package:flutter/material.dart';
import 'package:luxe/config.dart';
import 'package:luxe/providers/container_provider.dart';
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
    final List<dynamic> listaContenedores = contenedorProvider.listaContenedorPorTipo;

    final String name = ModalRoute.of(context)!.settings.arguments as String;

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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Title(),
            Expanded(
              child: ListView.builder(
                itemCount: listaContenedores.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(-1, 5))
                    ]),
                    child: ListTile(
                      iconColor: const Color.fromRGBO(0, 41, 107, 1),
                      leading: const Icon(Icons.credit_card),
                      title: Text(listaContenedores[index]['name']),
                      subtitle: Text(listaContenedores[index]['_id']),
                      onTap: () {
                        escogerContenedor(
                            name, listaContenedores[index]['_id'], context);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  //final UserProfileResponse userProfile;
  const Title({
    Key? key, //required this.userProfile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hey!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 35, 26, 156),
                      fontSize: 25),
                ),
                SizedBox(height: 10),
                Text('Aquí tienes lista los  contenedores disponibles',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontSize: 18, height: 2)),
                SizedBox(height: 20),
              ],
            ),
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
        return const Center(child: CircularProgressIndicator());
      });
  try {
    final url = Uri.https(ConfigLuxe.url,
        '/api/containers/assign/$id');

    final response = await http
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

    _alertSuccess(context);
  } catch (Error) {
    print(Error);
    print('http error');
  }
}

Future<dynamic> _alertSuccess(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.task_alt,
                  color: Color.fromARGB(255, 46, 227, 88),
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
                      onPressed: () =>
                          Navigator.pushNamed(context, 'principal')),
                ],
              )
            ],
          ));
}
