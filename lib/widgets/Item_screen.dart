import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';

class Item_Screen extends StatelessWidget {
  final ItemElement objeto;
  const Item_Screen({Key? key, required this.objeto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      objeto.imgClient,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        objeto.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Italic'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Descripción",
                      style: TextStyle(fontFamily: 'Roboto-Italic')),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    objeto.description,
                    style: TextStyle(fontFamily: 'Roboto-Italic'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              color: Color.fromRGBO(64, 75, 99, 1)
                                  .withOpacity(0.1),
                              blurRadius: 7)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Image.asset(
                            //   'assets/punto.png',
                            //   width: 8,
                            //   fit: BoxFit.cover,
                            //   color: Color.fromRGBO(0, 217, 219, 1),
                            // ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Descripción:",
                              style: TextStyle(
                                  fontFamily: 'Roboto-Italic',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          objeto.description,
                          style: TextStyle(fontFamily: 'Roboto-Italic'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
