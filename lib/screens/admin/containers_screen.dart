import 'package:flutter/material.dart';
import 'package:luxe/config.dart';
import 'package:luxe/models/container_response.dart';
import 'package:luxe/providers/container_provider.dart';
import 'package:luxe/widgets/menu.dart';
import 'package:provider/provider.dart';

class ContainesScreen extends StatefulWidget {
  ContainesScreen({Key? key}) : super(key: key);

  @override
  State<ContainesScreen> createState() => _ContainesScreenState();
}

class _ContainesScreenState extends State<ContainesScreen> {
  @override
  Widget build(BuildContext context) {

    final ContenedorProvider containerProvider = Provider.of<ContenedorProvider>(context);
    final List<Contenedor> containers = containerProvider.listaContenedores;

    return Scaffold(
        drawer: myMenu(),
        appBar: AppBar(
          title: const Text('Contenedores'),
          backgroundColor: ConfigLuxe.colorBlue,
        ),
        body: (containers.isEmpty)
        ? const Center(child: CircularProgressIndicator(color: Colors.grey),)
        :
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: containers.length,
                  itemBuilder: (context, index) {
                    final container = containers[index];

                    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(-1, 5))
                    ]),
                    child: ListTile(
                      iconColor: const Color.fromRGBO(0, 41, 107, 1),
                      leading: const Icon(Icons.credit_card),
                      title: Text(container.name),
                      subtitle: Text(container.id),
                      trailing:(container.assignUser == null)? Icon(Icons.check_circle_outline, color: Colors.green[800],size: 30): null,
                      onTap: () {
                      },
                    ),
                  );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xffFDC500),
        onPressed: () {
        },
      ),
        );
      
  }
}