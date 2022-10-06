import 'package:flutter/material.dart';

class ObjetsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
      onPressed:(){ 
      // Navigator.pop(context);
      }, 
      icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(
      onPressed:(){ 
      Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    return Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return Text('Results');
  }

}