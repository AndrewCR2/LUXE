// To parse this JSON data, do
//
//     final itemResponse = itemResponseFromMap(jsonString);

import 'dart:convert';

class ItemResponse {
    ItemResponse({
        required this.total,
        required this.items,
    });

    int total;
    List<Item> items;

    factory ItemResponse.fromJson(String str) => ItemResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemResponse.fromMap(Map<String, dynamic> json) => ItemResponse(
        total: json["total"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class Item {
    Item({
        required this.id,
        required this.name,
        required this.description,
        required this.imgClient,
        required this.imgStore,
        required this.user,
        required this.container,
    });

    String id;
    String name;
    String description;
    String imgClient;
    String imgStore;
    ContainerItem user;
    ContainerItem container;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        imgClient: json["img_client"],
        imgStore: json["img_store"],
        user: ContainerItem.fromMap(json["user"]),
        container: ContainerItem.fromMap(json["container"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "img_client": imgClient,
        "img_store": imgStore,
        "user": user.toMap(),
        "container": container.toMap(),
    };
}

class ContainerItem {
    ContainerItem({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory ContainerItem.fromJson(String str) => ContainerItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContainerItem.fromMap(Map<String, dynamic> json) => ContainerItem(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
    };
}
