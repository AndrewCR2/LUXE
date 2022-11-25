import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/widgets/usuario_screen.dart';
import 'package:provider/provider.dart';

class myMenu extends StatefulWidget {
  // final UserProfileResponse userProfile;

  //myMenu({Key? key, required this.userProfile}) : super(key: key);

  State<myMenu> createState() => _myMenuState();
}

class _myMenuState extends State<myMenu> {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(userProfileProvider.user!.user, context),
          buildMenuItems(context),
        ],
      )),
    );
  }

<<<<<<< HEAD
  Widget buildHeader(User user, BuildContext context) => Material(
        color: Color.fromRGBO(10, 37, 106, 1),
=======
  Widget buildHeader(User user ,BuildContext context) => Material(
        color: const Color.fromRGBO(10, 37, 106, 1),
>>>>>>> b724584b70c85130a3599702dceea872ccb8eddd
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
<<<<<<< HEAD
                  child: CircleAvatar(
                      radius: 52,
                      backgroundImage: AssetImage('assets/LUXE.png'),
                      backgroundColor: Colors.white),
=======
                  child: const CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage('assets/LUXE.png'),
                    backgroundColor: Color.fromRGBO(0, 217, 219, 1),
                  ),
>>>>>>> b724584b70c85130a3599702dceea872ccb8eddd
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.amber, width: 3.0),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  user.name,
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
                  user.email,
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
            Divider(),
            ListTile(
              title: const Text('Estado de cuenta',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Italic',
                  )),
              leading: Icon(
                Icons.bar_chart,
              ),
              onTap: () {
                Navigator.pushNamed(context, 'estado_cuenta');
              },
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
                Navigator.pushNamed(context, 'ruta_ingresar');
              },
            )
          ],
        ),
      );
}
