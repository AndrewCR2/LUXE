import 'package:flutter/material.dart';

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
                  'Andrew',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Centro de Salud "Buenos Aires de Villa"',
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
        'https://img.freepik.com/foto-gratis/covid-19-trabajadores-salud-concepto-pandemia-hermosa-solicita-medico-asiatico-enfermera-matorrales-mostrando-gesto-corazon-sonriendo-cuidando-pacientes-amor-fondo-blanco_1258-84118.jpg?w=1800&t=st=1656779950~exp=1656780550~hmac=7fd2fb4cbbabaf308f0fcf8bc96f23b616a5f5d8f6c2dafe6d7a372891166e0d',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ));

  Widget bulidProfileImage() => Container(
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Color.fromRGBO(0, 217, 219, 1),
          backgroundImage: AssetImage('assets/LUXE.png'),
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
