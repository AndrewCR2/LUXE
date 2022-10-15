import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/providers/user_profile_provider.dart';
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
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(height: 20,),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.menu,color: Colors.black,size: 28,),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ),

            

            Title(),

            _inventario(),

            _almacen(),

            _salidaAlmacen(),

            _traspaso()

            ],
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text('Bienvenido !', style: TextStyle(fontWeight: FontWeight.bold,
                                                         color: Color.fromARGB(255, 14, 108, 185),
                                                         fontSize: 25
                                                         ), 
                ),
              /* Text(
                    userProfile.user.name,
                    style: TextStyle(fontSize: 25, color: Color(0xff00509d), fontWeight: FontWeight.bold),
                  ), */
              
              Container(height: 20,),

              Text('¿Qué deseas hacer?', style: TextStyle(color: Colors.black,
                                                          fontSize: 18
                                                          )
                ),
            ],
          ),

        ],
      ),
    );
  }
}


class _inventario extends StatelessWidget {
  const _inventario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 28),
      width: 350,
      height: 78,
      child: FlatButton(
        //icon: Icon(Icons.abc),
        color: Color.fromARGB(255, 236, 195, 90),
        
        child: Row(
          
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 67,
              width: 67,
              decoration: new BoxDecoration(
                          image: new DecorationImage(image: AssetImage('assets/contenedor.JPG'),
                                                     fit: BoxFit.fill
                                                    ),
                          borderRadius: BorderRadius.circular(30)   
                          ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Adquirir Contenedor', style: TextStyle(fontSize: 20),), 
              ),
          ],
        ),
        
        onPressed: (){
          Navigator.pushReplacementNamed(context, 'form_contenedor');
        },
      ),
    );
  }
}

class _almacen extends StatelessWidget {
  const _almacen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 28),
      width: 350,
      height: 78,
      child: FlatButton(
        color: Color.fromARGB(243, 134, 216, 67),
        child: Row(
          
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 67,
              width: 67,
              decoration: new BoxDecoration(
                          image: new DecorationImage(image: AssetImage('assets/derecha.JPG'),
                                                     fit: BoxFit.fill
                                                    ),
                          borderRadius: BorderRadius.circular(30)   
                          ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Almacen', style: TextStyle(fontSize: 20),), 
              ),
          ],
        ),
        
        onPressed: (){
          Navigator.pushReplacementNamed(context, 'almacen');
        },
      ),
    );
  }
}

class _salidaAlmacen extends StatelessWidget {
  const _salidaAlmacen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 28),
      width: 350,
      height: 78,
      child: FlatButton(
        color: Color.fromARGB(243, 223, 91, 172),

        child: Row(
          
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 67,
              width: 67,
              decoration: new BoxDecoration(
                          image: new DecorationImage(image: AssetImage('assets/izquierda.JPG'),
                                                     fit: BoxFit.fill
                                                    ),
                          borderRadius: BorderRadius.circular(30)   
                          ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Salida Almacen', style: TextStyle(fontSize: 20),), 
              ),
          ],
        ),
        
        onPressed: (){

        },
      ),
    );
  }
}

class _traspaso extends StatelessWidget {
  const _traspaso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 28),
      width: 350,
      height: 78,
      child: FlatButton(
        color: Color.fromARGB(243, 60, 115, 234),
        child: Row(
          
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 67,
              width: 67,
              decoration: new BoxDecoration(
                          image: new DecorationImage(image: AssetImage('assets/camion.JPG'),
                                                     fit: BoxFit.fill
                                                    ),
                          borderRadius: BorderRadius.circular(30)   
                          ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Traspaso', style: TextStyle(fontSize: 20),), 
              ),
          ],
        ),
        
        onPressed: (){

        },
      ),
    );
  }
}


