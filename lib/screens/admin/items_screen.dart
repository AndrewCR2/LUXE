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
        body: (items == null)
        ? Center(child: CircularProgressIndicator(color: Colors.grey),)
        :
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return SizedBox(
                      child: Row(
                        children: [
                          Text(item.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20)),
                          const Expanded(child: SizedBox()),
                          if (item.imgStore == "")
                            const Text(
                              'Actualizar imagen',
                              style:
                                  TextStyle(color: Color.fromARGB(255, 59, 82, 60), fontSize: 18),
                            ),
                          IconButton(
                              onPressed: () {
                                optionsAlert(item: item, context: context);
                              },
                              icon: const Icon(Icons.more_vert_outlined))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
