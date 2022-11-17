import 'package:flutter/material.dart';
import 'package:luxe/providers/user_profile_provider.dart';
import 'package:luxe/search/objetos_search.dart';
import 'package:luxe/widgets/menu.dart';
import 'package:luxe/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AlmacenScreen extends StatefulWidget {
  const AlmacenScreen({Key? key}) : super(key: key);

  @override
  State<AlmacenScreen> createState() => _AlmacenScreenState();
}

class _AlmacenScreenState extends State<AlmacenScreen> {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    final userItems = userProfileProvider.items; // lista de items del usuario

    final List<Widget> items = List.generate(
        userItems.length, (index) => CardItem(objeto: userItems[index]));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            (userProfileProvider.user != null)
                ? HeaderAlmacen(userProfile: userProfileProvider.user!)
                : const _HeaderLoading(),
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
        onPressed: () {
          Navigator.pushNamed(context, 'formulario_items');
        },
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
      pinned: true,
      leading: IconButton(
        color: Color.fromRGBO(0, 217, 219, 1),
        icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () => {Navigator.of(context).pop()},
      ),
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

class _HeaderLoading extends StatelessWidget {
  const _HeaderLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
      height: 130,
      color: const Color(0xff00509d),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      ),
    );
  }
}
