import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luxe/models/user_profile_response.dart';

class UserProfileProvider extends ChangeNotifier {
  final String _baseUrl = "localhost:8080";
  
  UserProfileResponse? user;

  UserProfileProvider() {
    getUserProfile();
  }

  getUserProfile() async {
    var url = Uri.http(_baseUrl, '/api/userprofile');

    final headers = {
      'x-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMzNjMTA5ZThkNTlhYzgyYzEyOWViZCIsImlhdCI6MTY2NTE3MDE2NywiZXhwIjoxNjY1MTg0NTY3fQ.CQBPKoDzLVw5kKNA-P4I90gBbEmRkNyQgUOLqEVB8CY'
    };
    final response = await http.get(url, headers: headers);

    if (response.body == 'Token no valido') {
      print('================');
      print('Vamoos');
      print('================');
      return;
    }

    user = UserProfileResponse.fromJson(response.body);

    notifyListeners();
  }
}
