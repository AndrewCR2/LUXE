import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:luxe/config.dart';

class ContenedorProvider extends ChangeNotifier{
  
  final String _baseUrl = ConfigLuxe.url;

  List<dynamic> listaContenedor =[];

  ContenedorProvider(){
    print('Ingresando a ContenedorProvider');
    //this.getOnContainerList();
  }

  buscarContainer(String plan) async{
    final url = 
        Uri.https(_baseUrl, '/api/containers/available',{'type': plan});
    final response = await http
        .get(url)
        .timeout(const Duration(seconds: 90));

    final jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    listaContenedor = jsonResponse['containers'];

    print(listaContenedor);
    
      notifyListeners();
  }
}