// To parse this JSON data, do
//
//     final userProfileResponse = userProfileResponseFromMap(jsonString);

import 'dart:convert';

class UserProfileResponse {
    UserProfileResponse({
        required this.user,
        required this.account,
        required this.container,
        required this.item,
    });

    User user;
    Account account;
    UserProfileResponseContainer container;
    UserProfileResponseItem item;

    factory UserProfileResponse.fromJson(String str) => UserProfileResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserProfileResponse.fromMap(Map<dynamic, dynamic> json) => UserProfileResponse(
        user: User.fromMap(json["user"]),
        account: Account.fromMap(json["account"]),
        container: UserProfileResponseContainer.fromMap(json["container"]),
        item: UserProfileResponseItem.fromMap(json["item"]),
    );

    Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "account": account.toMap(),
        "container": container.toMap(),
        "item": item.toMap(),
    };
}

class Account {
    Account({
        required this.id,
        required this.user,
        required this.registrationDate,
        required this.plan,
        required this.rentalPrice,
        required this.expirationDate,
    });

    String id;
    String user;
    int registrationDate;
    String plan;
    int rentalPrice;
    int expirationDate;

    factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Account.fromMap(Map<String, dynamic> json) => Account(
        id: json["_id"],
        user: json["user"],
        registrationDate: json["registration_date"],
        plan: json["plan"],
        rentalPrice: json["rental_price"],
        expirationDate: json["expiration_date"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "user": user,
        "registration_date": registrationDate,
        "plan": plan,
        "rental_price": rentalPrice,
        "expiration_date": expirationDate,
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
        required this.nameByUser,
        required this.nroItems,
        required this.maximumSpace,
        required this.typeContainer,
        required this.rental,
        required this.user,
        required this.assignUser,
    });

    String id;
    String name;
    String nameByUser;
    int nroItems;
    int maximumSpace;
    String typeContainer;
    int rental;
    String user;
    String assignUser;

    factory ContainerElement.fromJson(String str) => ContainerElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContainerElement.fromMap(Map<String, dynamic> json) => ContainerElement(
        id: json["_id"],
        name: json["name"],
        nameByUser: json["name_by_user"],
        nroItems: json["nro_items"],
        maximumSpace: json["maximum_space"],
        typeContainer: json["type_container"],
        rental: json["rental"],
        user: json["user"],
        assignUser: json["assign_user"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "name_by_user": nameByUser,
        "nro_items": nroItems,
        "maximum_space": maximumSpace,
        "type_container": typeContainer,
        "rental": rental,
        "user": user,
        "assign_user": assignUser,
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
    String user;
    ItemContainer container;

    factory ItemElement.fromJson(String str) => ItemElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemElement.fromMap(Map<String, dynamic> json) => ItemElement(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        imgClient: json["img_client"],
        imgStore: json["img_store"],
        user: json["user"],
        container: ItemContainer.fromMap(json["container"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "img_client": imgClient,
        "img_store": imgStore,
        "user": user,
        "container": container.toMap(),
    };
}

class ItemContainer {
    ItemContainer({
        required this.id,
        required this.name,
        required this.nameByUser,
    });

    String id;
    String name;
    String nameByUser;

    factory ItemContainer.fromJson(String str) => ItemContainer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemContainer.fromMap(Map<String, dynamic> json) => ItemContainer(
        id: json["_id"],
        name: json["name"],
        nameByUser: json["name_by_user"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "name_by_user": nameByUser,
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
