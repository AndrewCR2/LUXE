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
                      child: ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          final item = items[index];

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: (item.imgStore == "")
                                    ? Color.fromARGB(255, 222, 242, 216)
                                    : Colors.white,
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
                              title: Text(item.name),
                              subtitle: Text(item.user.name),
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
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
