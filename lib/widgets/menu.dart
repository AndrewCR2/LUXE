import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/providers/Item_provider.dart';
import 'package:luxe/providers/providers.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/screens/admin/containers_screen.dart';
import 'package:luxe/screens/admin/items_screen.dart';
import 'package:luxe/screens/admin/users_screen.dart';
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
          buildMenuItems(userProfileProvider.user!.user, context),
        ],
      )),
    );
  }

  Widget buildHeader(User user, BuildContext context) => Material(
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
                      backgroundColor: Colors.white),
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
  Widget buildMenuItems(User user, BuildContext context) => Container(
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
            if (user.role == 'ADMIN_ROLE')
              Column(
                children: [_AdminOptions()],
              ),
            Divider(),
            ListTile(
              title: Text('Cerrar Sesión',
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto-Italic',
                  )),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red[800],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_ingresar');
              },
            )
          ],
        ),
      );
}

class _AdminOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Crud users',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto-Italic',
              )),
          leading: const Icon(
            Icons.person,
          ),
          onTap: () {
            Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => UsersScreen()));
          },
        ),
        ListTile(
          title: const Text('Crud containers',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto-Italic',
              )),
          leading: const Icon(Icons.content_paste_sharp),
          onTap: () {
            Provider.of<ContenedorProvider>(context, listen: false).getContainers();

            Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ContainesScreen()));
          },
        ),
        ListTile(
          title: const Text('Crud items',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto-Italic',
              )),
          leading: const Icon(Icons.propane_tank_rounded),
          onTap: () {
            Provider.of<ItemProvider>(context, listen: false).getItems();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ItemsScreen()));
          },
        ),
      ],
    );
  }
}
