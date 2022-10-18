import 'package:flutter/material.dart';
import 'package:luxe/shared_preferences/preferences.dart';

class myMenu extends StatefulWidget {
  @override
  State<myMenu> createState() => _myMenuState();
}

class _myMenuState extends State<myMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      color: Color.fromARGB(255, 165, 162, 162),
      child: ListView(
        padding: EdgeInsets.only(top: 50.0),
        children: <Widget>[
          Container(
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/LUXE.png'), fit: BoxFit.fill),
            ),
          ),
          Divider(),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            trailing: const Icon(
              Icons.home,
              size: 30.0,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'principal');
            },
          ),
          Container(
            height: 5,
            color: Color.fromARGB(255, 165, 162, 162),
          ),
          const ListTile(
            title: Text(
              'Estado de cuenta',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            trailing: Icon(
              Icons.bar_chart,
              size: 40.0,
              color: Colors.black,
            ),
          ),
          Container(
            height: 230,
            color: Color.fromARGB(255, 165, 162, 162),
          ),
          Divider(),
          ListTile(
            title: const Text('Cerrar Sesión',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            trailing:
                const Icon(Icons.exit_to_app, size: 30.0, color: Colors.black),
            onTap: () {
              Preferences.token = '';
              Navigator.restorablePopAndPushNamed(context, 'ruta_ingresar');
            },
          )
        ],
      ),
    );
  }
}
