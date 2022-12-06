
import 'dart:convert';

class ContenedorResponse {
  ContenedorResponse({
    required this.total,
    required this.containers,
  });

  int total;
  List<Contenedor> containers;

  factory ContenedorResponse.fromJson(String str) =>
      ContenedorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContenedorResponse.fromMap(Map<String, dynamic> json) =>
      ContenedorResponse(
        total: json["total"],
        containers: List<Contenedor>.from(
            json["containers"].map((x) => Contenedor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "containers": List<dynamic>.from(containers.map((x) => x.toMap())),
      };
}

class Contenedor {
  Contenedor({
    required this.id,
    required this.name,
    required this.nameByUser,
    required this.nroItems,
    required this.maximumSpace,
    required this.typeContainer,
    required this.rental,
    required this.user,
    this.assignUser,
  });

  String id;
  String name;
  String nameByUser;
  int nroItems;
  int maximumSpace;
  String typeContainer;
  int rental;
  String user;
  AssignUser? assignUser;

  factory Contenedor.fromJson(String str) =>
      Contenedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contenedor.fromMap(Map<String, dynamic> json) => Contenedor(
        id: json["_id"],
        name: json["name"],
        nameByUser: json["name_by_user"],
        nroItems: json["nro_items"],
        maximumSpace: json["maximum_space"],
        typeContainer: json["type_container"],
        rental: json["rental"],
        user: json["user"],
        assignUser: json["assign_user"] == null
            ? null
            : AssignUser.fromMap(json["assign_user"]),
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
        "assign_user": assignUser == null ? null : assignUser!.toMap(),
      };
}

class AssignUser {
  AssignUser({
    required this.id,
    required this.name,
    required this.email,
  });

  String id;
  String name;
  String email;

  factory AssignUser.fromJson(String str) =>
      AssignUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssignUser.fromMap(Map<String, dynamic> json) => AssignUser(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
      };
}


// import 'dart:convert';

// class ContenedorResponse {
//     ContenedorResponse({
//         required this.total,
//         required this.containers,
//     });

//     int total;
//     List<Contenedor> containers;

//     factory ContenedorResponse.fromJson(String str) => ContenedorResponse.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ContenedorResponse.fromMap(Map<String, dynamic> json) => ContenedorResponse(
//         total: json["total"],
//         containers: List<Contenedor>.from(json["containers"].map((x) => Contenedor.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "total": total,
//         "containers": List<dynamic>.from(containers.map((x) => x.toMap())),
//     };
// }

// class Contenedor {
//     Contenedor({
//         required this.id,
//         required this.name,
//         required this.nameByUser,
//         required this.nroItems,
//         required this.maximumSpace,
//         required this.typeContenedor,
//         required this.rental,
//         required this.user,
//         required this.assignUser,
//     });

//     String id;
//     String name;
//     String nameByUser;
//     int nroItems;
//     int maximumSpace;
//     String typeContenedor;
//     int rental;
//     String user;
//     dynamic assignUser;

//     factory Contenedor.fromJson(String str) => Contenedor.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Contenedor.fromMap(Map<String, dynamic> json) => Contenedor(
//         id: json["_id"],
//         name: json["name"],
//         nameByUser: json["name_by_user"],
//         nroItems: json["nro_items"],
//         maximumSpace: json["maximum_space"],
//         typeContenedor: json["type_container"],
//         rental: json["rental"],
//         user: json["user"],
//         assignUser: json["assign_user"] == null ? null : json["assign_user"],
//     );

//     Map<String, dynamic> toMap() => {
//         "_id": id,
//         "name": name,
//         "name_by_user": nameByUser,
//         "nro_items": nroItems,
//         "maximum_space": maximumSpace,
//         "type_container": typeContenedor,
//         "rental": rental,
//         "user": user,
//         "assign_user": assignUser == null ? null : assignUser,
//     };
// }







// import 'package:luxe/models/container.dart';

// class ContenedorResponse {
//     ContenedorResponse({
//         required this.total,
//         required this.contenedores,
//     });

//     int total;
//     List<Contenedore> contenedores;
    

//     factory ContenedorResponse.fromJson(String str) => ContenedorResponse.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ContenedorResponse.fromMap(Map<String, dynamic> json) => ContenedorResponse(
//         total: json["total"],
//         contenedores: List<Contenedore>.from(json["containers"].map((x) => Contenedore.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "total": total,
//         "containers": List<dynamic>.from(contenedores.map((x) => x.toMap())),
//     };
// }
