import 'package:flutter/material.dart';
import 'package:luxe/config.dart';
import 'package:luxe/helpers/alert.dart';
import 'package:luxe/models/item_response.dart';
import 'package:luxe/providers/Item_provider.dart';
import 'package:luxe/widgets/menu.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final List<Item> items = itemProvider.items;

    return Scaffold(
        drawer: myMenu(),
        appBar: AppBar(
          title: Text('CRUD ITEMS'),
          backgroundColor: ConfigLuxe.colorBlue,
        ),
        body: (items.isEmpty)
            ? const Center(
                child: CircularProgressIndicator(color: Colors.grey),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          return _ItemCard(item: item);
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: (item.imgStore == "")
              ? const Color.fromARGB(255, 213, 250, 199)
              : Colors.white,
          border:Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(
                        255, 199, 199, 199)
                    .withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(-1, 5))
          ]),
      child: ListTile(
        iconColor: const Color.fromRGBO(0, 41, 107, 1),
        title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
        subtitle: Text(item.user.email, style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 58, 58, 58))),
        trailing: Container(
          width: 100,
          height: 50,
          child: Row(
            children: [
              Expanded(child: Container()),
              if (item.imgStore == "")
                Icon(Icons.notifications_active_outlined,
                    color: Colors.green[800], size: 30),
              IconButton(
                  onPressed: () {
                    optionsAlert(
                        item: item, context: context);
                  },
                  icon: const Icon(
                      Icons.more_vert_outlined))
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
