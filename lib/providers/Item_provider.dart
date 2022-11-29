import 'package:flutter/material.dart';
import 'package:luxe/config.dart';
import 'package:luxe/models/item_response.dart';
import 'package:http/http.dart' as http;

class ItemProvider extends ChangeNotifier{

  final String _baseUrl = ConfigLuxe.url;
  List<Item> items = [];

  getItems () async {
    final url = Uri.https(_baseUrl, '/api/items');
    final response = await http.get(url);

    final ItemResponse listResponse = ItemResponse.fromJson(response.body);
    items = listResponse.items;
    print(items);
    notifyListeners();
  }
}