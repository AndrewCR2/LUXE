import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/shared_preferences/preferences.dart';

class UserProfileProvider extends ChangeNotifier {
  final String _baseUrl = "luxe-api-rest-production.up.railway.app";
  // final String _baseUrl = "localhost:8080";

  UserProfileResponse? user;
  List<ItemElement> items = [];
  List<ContainerElement> containers = [];

  getUserProfile(BuildContext context) async {
    try {
      var url = Uri.https(_baseUrl, '/api/userprofile');

      final token = Preferences.token;

      final response = await http.get(url, headers: {'x-token': token});

      if (response.body == 'Token no valido') {
        Preferences.token = ''; // reseteamos el token
        Navigator.pushReplacementNamed(context, 'ingresar');
        return;
      }

      user = UserProfileResponse.fromJson(response.body);
      items = user!.item.items;
      containers = user!.container.containers;

      notifyListeners();
    } catch (error) {

      print(error);
    }
  }
}
