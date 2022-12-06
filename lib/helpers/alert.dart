import 'package:flutter/material.dart';
import 'package:luxe/config.dart';
import 'package:luxe/models/container_response.dart';
import 'package:luxe/models/item_response.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/providers/container_provider.dart';
import 'package:luxe/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

displayCustomAlert({
  required BuildContext context,
  required IconData icon,
  required String message,
  required Color color,
  String? title,
  String? redirectRoute,
}) {
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
                  icon,
                  color: color,
                  size: 110,
                ),
                const SizedBox(height: 15),
                if (title != null)
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, color: color),
                  ),
                const SizedBox(height: 20),
                Text(
                  message,
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
                      onPressed: () => {
                            if (redirectRoute == null)
                              Navigator.pop(context)
                            else
                              Navigator.pushNamed(context, redirectRoute)
                          }),
                ],
              )
            ],
          ));
}

optionsAlert({required Item item, required BuildContext context}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            contentPadding: EdgeInsets.all(0),
            // title: const Text('Options'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'updateImg_item',
                          arguments: item);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: Row(
                        children: const [
                          Expanded(child: Text('Actualizar imagen')),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 25),
                  //     child: Row(
                  //       children: const [
                  //         Expanded(child: Text('Eliminar por estado')),
                  //         Icon(Icons.delete_outline_rounded)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () async {
                      final url = Uri.https(
                          ConfigLuxe.url, '/api/items/definitive/${item.id}');

                      final response = await http.delete(url, headers: {
                        'x-token': Preferences.token
                      }).timeout(const Duration(seconds: 90));

                      print(response.body);

                      Navigator.pushNamed(context, 'principal');
                      // Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: Row(
                        children: const [
                          Expanded(child: Text('Eliminar definitivamente')),
                          Icon(Icons.delete_forever_outlined)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      color: Colors.red[600],
                      child: const Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}

optionsAlertContainer(
    {required Contenedor contenedor, required BuildContext context}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            contentPadding: const EdgeInsets.all(0),
            // title: const Text('Options'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'edit_item',
                          arguments: contenedor);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: Row(
                        children: const [
                          Expanded(child: Text('Editar')),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 25),
                  //     child: Row(
                  //       children: const [
                  //         Expanded(child: Text('Eliminar por estado')),
                  //         Icon(Icons.delete_outline_rounded)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () async {
                      final url = Uri.https(ConfigLuxe.url,
                          '/api/containers/definitive/${contenedor.id}');

                      final response = await http.delete(url, headers: {
                        'x-token': Preferences.token
                      }).timeout(const Duration(seconds: 90));

                      Navigator.pushNamed(context, 'principal');
                      // Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: Row(
                        children: const [
                          Expanded(child: Text('Eliminar definitivamente')),
                          Icon(Icons.delete_forever_outlined)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      color: Colors.red[600],
                      child: const Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
