import 'package:flutter/material.dart';
import 'package:luxe/models/user_profile_response.dart';

class HeaderAlmacen extends StatelessWidget {
  final UserProfileResponse userProfile;
  const HeaderAlmacen({
    Key? key, required this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
      height: 130,
      color: const Color(0xff00509d),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children:[
                    const Text(
                      'Hola ',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      userProfile.user.name,
                      style: TextStyle(fontSize: 25, color: Color(0xff00509d), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                
                const Text('Tu plan vence el 04/11', style: TextStyle(fontSize: 15)),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Text('Objetos: '),
                    Text('${userProfile.item.total}', style: TextStyle(color: Color(0xff00509d))),
                  ],
                ),
                Row(
                  children:[
                    const Text('Contenedores: '),
                    Text('${userProfile.container.total}', style: TextStyle(color: Color(0xff00509d))),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
