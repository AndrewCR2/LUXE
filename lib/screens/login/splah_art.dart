import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luxe/screens/login/acceder_registrar.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({Key? key}) : super(key: key);

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const AccReg()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/LUXE.png',
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
