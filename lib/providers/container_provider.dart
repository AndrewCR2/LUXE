import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:luxe/config.dart';
import 'package:luxe/models/container_response.dart';

class ContenedorProvider extends ChangeNotifier {
  final String _baseUrl = ConfigLuxe.url;
  List<Contenedor> listaContenedores = [];
  List<dynamic> listaContenedorPorTipo = [];

  ContenedorProvider() {
    print('Ingresando a ContenedorProvider');
    //this.getOnContainerList();
  }

  getContainers() async {
    final url = Uri.https(_baseUrl, '/api/containers');
    final response = await http.get(url);
    final ContenedorResponse listResponse = ContenedorResponse.fromJson(response.body);
    listaContenedores = listResponse.containers;
    print(listaContenedores[0].name);
    notifyListeners();
  }

  buscarContainer(String plan) async {
    final url =
        Uri.https(_baseUrl, '/api/containers/available', {'type': plan});
    final response = await http.get(url).timeout(const Duration(seconds: 90));

    final jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    listaContenedorPorTipo = jsonResponse['containers'];

    notifyListeners();
  }
}
