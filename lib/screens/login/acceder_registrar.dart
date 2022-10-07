import 'package:flutter/material.dart';

class  AccReg extends StatefulWidget {
  const AccReg({Key? key}) : super(key: key);

  @override
  State<AccReg> createState() => _AccRegState();
}

class _AccRegState extends State<AccReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('todas mis prras'),),

      body: Center(
        child: Column(
          children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: const DecorationImage(image: AssetImage('assets/logo2.png'),fit: BoxFit.cover,
                ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 40
          ),

          Center(
            child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(image: AssetImage('assets/LUXE.png'),fit: BoxFit.cover,
                ),
                ),
              ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'ruta_ingresar');
            },
            child: Container(
            child: const Center(child: Text('Acceder',style: TextStyle(color: Colors.white),)),
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.amber
            ),
          ),
          ),

          SizedBox(
            height: 10,
          ),
          
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'registrese');
            },
            child: Container(
            child: const Center(child: Text('Registrar',style: TextStyle(color: Colors.amber),)),
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber),
              borderRadius: BorderRadius.circular(9),
              color: Colors.white
            ),
          ),
          ),

        ],
        ),
      )
    );
  }
}