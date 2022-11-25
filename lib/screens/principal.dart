import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/widgets/menu.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: myMenu(),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                const Title(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: const [
                    _PrincipalCard(
                        color: Color.fromARGB(255, 236, 195, 90),
                        nameCard: 'Adquirir Contenedor',
                        pathImg: 'assets/contenedor.JPG',
                        rutaScreen: 'form_contenedor'),
                    SizedBox(
                      height: 20,
                    ),
                    _PrincipalCard(
                        color: Color.fromARGB(243, 134, 216, 67),
                        nameCard: 'Almacen',
                        pathImg: 'assets/derecha.JPG',
                        rutaScreen: 'almacen'),
                    SizedBox(
                      height: 20,
                    ),
                    // _PrincipalCard(
                    //   color: Color.fromARGB(243, 223, 91, 172),
                    //   nameCard: 'Salida Almacen',
                    //   pathImg: 'assets/izquierda.JPG',
                    //   rutaScreen:  'no hay'),
                    //   SizedBox(height: 20,),
                    // _PrincipalCard(
                    //   color: Color.fromARGB(243, 60, 115, 234),
                    //   nameCard: 'Traspaso',
                    //   pathImg: 'assets/camion.JPG',
                    //   rutaScreen:  'no hay'),
                  ],
                )
              ],
            ))

        // _salidaAlmacen(),
        // _traspaso()
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bienvenido !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 108, 185),
                    fontSize: 25),
              ),
              Container(
                height: 20,
              ),
              const Text('¿Qué deseas hacer?',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrincipalCard extends StatelessWidget {
  final Color color;
  final String nameCard;
  final String rutaScreen;
  final String pathImg;

  const _PrincipalCard(
      {Key? key,
      required this.color,
      required this.nameCard,
      required this.pathImg,
      required this.rutaScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, rutaScreen);
      },
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 67,
              width: 67,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(pathImg), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  nameCard,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
