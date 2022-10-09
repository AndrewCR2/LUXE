
import 'dart:convert';

class UserProfileResponse {
    UserProfileResponse({
        required this.user,
        required this.container,
        required this.item,
    });

    User user;
    UserProfileResponseContainer container;
    UserProfileResponseItem item;

    factory UserProfileResponse.fromJson(String str) => UserProfileResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserProfileResponse.fromMap(Map<String, dynamic> json) => UserProfileResponse(
        user: User.fromMap(json["user"]),
        container: UserProfileResponseContainer.fromMap(json["container"]),
        item: UserProfileResponseItem.fromMap(json["item"]),
    );

    Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "container": container.toMap(),
        "item": item.toMap(),
    };
}

class UserProfileResponseContainer {
    UserProfileResponseContainer({
        required this.total,
        required this.containers,
    });

    int total;
    List<ContainerElement> containers;

    factory UserProfileResponseContainer.fromJson(String str) => UserProfileResponseContainer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserProfileResponseContainer.fromMap(Map<String, dynamic> json) => UserProfileResponseContainer(
        total: json["total"],
        containers: List<ContainerElement>.from(json["containers"].map((x) => ContainerElement.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "containers": List<dynamic>.from(containers.map((x) => x.toMap())),
    };
}

class ContainerElement {
    ContainerElement({
        required this.id,
        required this.name,
        required this.nroItems,
        required this.maximumSpace,
        required this.typeContainer,
        required this.user,
    });

    String id;
    String name;
    int nroItems;
    int maximumSpace;
    String typeContainer;
    String user;

    factory ContainerElement.fromJson(String str) => ContainerElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContainerElement.fromMap(Map<String, dynamic> json) => ContainerElement(
        id: json["_id"],
        name: json["name"],
        nroItems: json["nro_items"],
        maximumSpace: json["maximum_space"],
        typeContainer: json["type_container"],
        user: json["user"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "nro_items": nroItems,
        "maximum_space": maximumSpace,
        "type_container": typeContainer,
        "user": user,
    };
}

class UserProfileResponseItem {
    UserProfileResponseItem({
        required this.total,
        required this.items,
    });

    int total;
    List<ItemElement> items;

    factory UserProfileResponseItem.fromJson(String str) => UserProfileResponseItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserProfileResponseItem.fromMap(Map<String, dynamic> json) => UserProfileResponseItem(
        total: json["total"],
        items: List<ItemElement>.from(json["items"].map((x) => ItemElement.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class ItemElement {
    ItemElement({
        required this.id,
        required this.name,
        required this.imgClient,
        required this.imgStore,
        required this.user,
        required this.container,
    });

    String id;
    String name;
    String imgClient;
    String imgStore;
    String user;
    String container;

    factory ItemElement.fromJson(String str) => ItemElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemElement.fromMap(Map<String, dynamic> json) => ItemElement(
        id: json["_id"],
        name: json["name"],
        imgClient: json["img_client"],
        imgStore: json["img_store"],
        user: json["user"],
        container: json["container"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "img_client": imgClient,
        "img_store": imgStore,
        "user": user,
        "container": container,
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.img,
        required this.role,
        required this.address,
    });

    String id;
    String name;
    String email;
    String img;
    String role;
    String address;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        img: json["img"],
        role: json["role"],
        address: json["address"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "img": img,
        "role": role,
        "address": address,
    };
}
