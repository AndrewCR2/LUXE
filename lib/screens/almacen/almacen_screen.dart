import 'package:flutter/material.dart';
import 'package:luxe/search/objetos_search.dart';
import 'package:luxe/widgets/widgets.dart';

class AlmacenScreen extends StatefulWidget {
  const AlmacenScreen({Key? key}) : super(key: key);

  @override
  State<AlmacenScreen> createState() => _AlmacenScreenState();
}

class _AlmacenScreenState extends State<AlmacenScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> objetos = [
      {
        'name': 'Bici',
        'img': 'https://i.blogs.es/c90a6d/ftnom1twiaevulz/450_1000.jpg',
      },
      {
        'name': 'cajas',
        'img':
            'https://www.embalatgescastonbox.com/FitxersWeb/7901/cajas_etiquetadas.jpg',
      },
      {
        'name': 'Mueble',
        'img':
            'https://www.arqhys.com/wp-content/uploads/2012/12/Muebles-en-piel-sintetica.jpg',
      },
      {
        'name': 'Bici',
        'img': 'https://i.blogs.es/c90a6d/ftnom1twiaevulz/450_1000.jpg',
      },
      {
        'name': 'cajas',
        'img':
            'https://www.embalatgescastonbox.com/FitxersWeb/7901/cajas_etiquetadas.jpg',
      },
      {
        'name': 'Mueble',
        'img':
            'https://www.arqhys.com/wp-content/uploads/2012/12/Muebles-en-piel-sintetica.jpg',
      },
    ];

    final List<Widget> items = List.generate(
        objetos.length, (index) => CardItem(objeto: objetos[index]));

    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          const _CustomSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const HeaderAlmacen(),
            const Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: Text('Almacen',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            ...items
          ]))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xffFDC500),
        onPressed: () {},
      ),
    );
  }
}

// ===================  AppBar  ==================================
class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      centerTitle: true,
      title: const Text(
        'LUXE Almacen',
      ),
      actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: ObjetsSearch());
            },
            icon: const Icon(
              Icons.search,
            ))
      ],
      backgroundColor: const Color(0xff00509d),
    );
  }
}


