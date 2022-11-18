import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;




class ContenedorProvider extends ChangeNotifier{
  
  final String _baseUrl = "luxe-api-rest-production-e0e0.up.railway.app";

  List<dynamic> listaContenedor =[];

  ContenedorProvider(){
    print('Ingresando a ContenedorProvider');
    //this.getOnContainerList();
  }


  buscarContainer(String plan) async{
    var url = 
        Uri.https(_baseUrl, '/api/containers/available',{'type': plan});
    var response = await http
        .get(url)
        .timeout(const Duration(seconds: 90));
    print('=======================================//////////');

    print(response.body);
    print('=======================================//////////');
    //final ContainerResponse rsp = ContainerResponse.fromJson(response.body);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    listaContenedor = jsonResponse['containers'];

    //listaContenedor = rsp.contenedores;

    print(listaContenedor);
    
      notifyListeners();
  }
}