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

    return Text('hola');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
    return const Center(
        child: Icon(
          Icons.airplay_rounded,
          size: 100,
          color: Colors.grey,
        ),
      );

    }
    return    Text(query);
  }

}