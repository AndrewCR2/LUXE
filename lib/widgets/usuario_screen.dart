import 'package:flutter/material.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:provider/provider.dart';

class UsuarioScreen extends StatefulWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

  @override
  State<UsuarioScreen> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {

    final UserProfileProvider userProfileProvider = Provider.of<UserProfileProvider>(context);

    final user = userProfileProvider.user!.user;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            buildTop(),
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Luxe almacenes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(),
                SizedBox(
                  height: 16,
                ),
                buildContent2()
              ],
            )
          ],
        ));
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: bulidProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network(
        'https://www.movint.es/wp-content/uploads/2020/07/26-ERGONOMIA-CONVENCIONAL-2-scaled-2194x1097.jpg',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ));

  Widget bulidProfileImage() => Container(
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.white,
          backgroundImage: const AssetImage('assets/LUXE.png'),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5.0),
        ),
      );
  Widget buildContent2() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Info',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '',
              style: TextStyle(fontSize: 18, height: 1.4),
            )
          ],
        ),
      );
}
