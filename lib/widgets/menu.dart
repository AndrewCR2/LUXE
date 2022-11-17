import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/shared_preferences/preferences.dart';
import 'package:luxe/widgets/usuario_screen.dart';

class myMenu extends StatefulWidget {
  // final UserProfileResponse userProfile;

  //myMenu({Key? key, required this.userProfile}) : super(key: key);

  State<myMenu> createState() => _myMenuState();
}

class _myMenuState extends State<myMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Color.fromRGBO(10, 37, 106, 1),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UsuarioScreen()));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage('assets/LUXE.png'),
                    backgroundColor: Color.fromRGBO(0, 217, 219, 1),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.0),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "LUEXE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Roboto-Italic',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'andrew54gmail.com',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontFamily: 'Roboto-Italic',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: [
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Italic',
                ),
              ),
              leading: const Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'principal');
              },
            ),
            ListTile(
              title: const Text('Estado de cuenta',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Italic',
                  )),
              leading: Icon(
                Icons.bar_chart,
              ),
            ),
            Divider(),
            ListTile(
              title: const Text('Cerrar Sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Italic',
                  )),
              leading: const Icon(
                Icons.exit_to_app,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'ruta_ingresar');
              },
            )
          ],
        ),
      );
}
