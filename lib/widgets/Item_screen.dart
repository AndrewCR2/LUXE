import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/widgets/datItems.dart';

class Item_Screen extends StatelessWidget {
  final ItemElement objeto;
  const Item_Screen({Key? key, required this.objeto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images1 = [objeto.imgClient, objeto.imgStore];
    print(images1);
    return Scaffold(
      appBar: AppBar(
        title: Text("Item"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
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
                    height: 400,
                    child: Swiper(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: (objeto.imgClient != '' ||
                                          objeto.imgStore != '')
                                      ? Image.network(
                                          images1[index],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const FadeInImage(
                                                placeholder: AssetImage(
                                                    'assets/Loading_icon.gif'),
                                                image: AssetImage(
                                                    'assets/no-image.jpg'));
                                          },
                                        )
                                      : const Image(
                                          image:
                                              AssetImage('assets/no-image.jpg'),
                                          height: 120,
                                          width: 140,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      scale: 0.9,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    objeto.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Italic'),
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        Text(
                          "Descripción:",
                          style: _subtitleStyle(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          objeto.description,
                          style: _textStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Contenedor:", style: _subtitleStyle()),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Nombre: ',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              objeto.container.name,
                              style:_textStyle(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Nombre asignado: ',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                objeto.container.nameByUser,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style:_textStyle()
                              ),
                            ),
                          ],
                        )
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

  TextStyle _textStyle() => TextStyle(fontSize: 15, fontFamily: 'Roboto-Italic');

  TextStyle _subtitleStyle() {
    return TextStyle(
        fontSize: 20, fontFamily: 'Roboto-Italic', fontWeight: FontWeight.bold);
  }
}
