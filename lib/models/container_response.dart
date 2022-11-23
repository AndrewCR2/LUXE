import 'dart:convert';

import 'package:luxe/models/container.dart';

class ContainerResponse {
    ContainerResponse({
        required this.total,
        required this.contenedores,
    });

    int total;
    List<Contenedore> contenedores;
    

    factory ContainerResponse.fromJson(String str) => ContainerResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContainerResponse.fromMap(Map<String, dynamic> json) => ContainerResponse(
        total: json["total"],
        contenedores: List<Contenedore>.from(json["containers"].map((x) => Contenedore.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "containers": List<dynamic>.from(contenedores.map((x) => x.toMap())),
    };
}
