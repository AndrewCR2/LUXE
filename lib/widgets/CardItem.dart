import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Map<String, dynamic> objeto;
  const CardItem({Key? key, required this.objeto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
            child: Image(
              image: NetworkImage(objeto['img']),
              height: 120,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
            Text(
              objeto['name'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'ABA',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            ]),
          )
        ],
      ),
    );
  }
}