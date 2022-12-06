import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';
import 'package:luxe/widgets/Item_screen.dart';

class CardItem extends StatelessWidget {
  final ItemElement objeto;
  const CardItem({Key? key, required this.objeto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(pageBuilder: (context, animtiom, __) {
            return Item_Screen(
              objeto: objeto,
            );
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: 120,
        decoration: BoxDecoration(
            color: (objeto.imgStore == '')
                ? const Color.fromARGB(255, 222, 248, 223)
                : Colors.white,
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
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: _ShowImgItem(
                    urlImgClient: objeto.imgClient,
                    urlImgStore: objeto.imgStore)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        objeto.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        objeto.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey[899]),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ShowImgItem extends StatelessWidget {
  final String urlImgClient;
  final String urlImgStore;
  const _ShowImgItem(
      {Key? key, required this.urlImgClient, required this.urlImgStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (urlImgStore != '')
        ? FadeInImage(
            placeholder: const AssetImage('assets/Loading_icon.gif'),
            image: NetworkImage(urlImgStore),
            height: 120,
            width: 140,
            fit: BoxFit.cover,
          )
        : (urlImgClient != '')
            ? FadeInImage(
                placeholder: const AssetImage('assets/Loading_icon.gif'),
                image: NetworkImage(urlImgClient),
                height: 120,
                width: 140,
                fit: BoxFit.cover,
              )
            : const Image(
                image: AssetImage('assets/no-image.jpg'),
                height: 120,
                width: 140,
                fit: BoxFit.cover,
              );
  }
}
