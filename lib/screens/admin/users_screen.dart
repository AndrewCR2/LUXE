import 'package:flutter/material.dart';
import 'package:luxe/config.dart';
import 'package:luxe/widgets/menu.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myMenu(),
        appBar: AppBar(
          title: Text('Usuarios'),
          backgroundColor: ConfigLuxe.colorBlue,
        ),
        body: const Center(child: CircularProgressIndicator(color: Colors.grey),), // Pendiente usuarios
    );
  }
}