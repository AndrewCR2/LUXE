import 'dart:convert';

class Contenedore {
    Contenedore({
        required this.id,
        required this.name,
        required this.nameByUser,
        required this.nroItems,
        required this.maximumSpace,
        required this.typeContainer,
        required this.alquiler,
        required this.usuario,
        required this.assignUser,
        required this.espacioMximo,
        required this.tipoContenedor,
        required this.asignarUsuario,
    });

    String id;
    String name;
    String nameByUser;
    int nroItems;
    int maximumSpace;
    String typeContainer;
    int alquiler;
    String usuario;
    dynamic assignUser;
    int espacioMximo;
    String tipoContenedor;
    dynamic asignarUsuario;

    factory Contenedore.fromJson(String str) => Contenedore.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Contenedore.fromMap(Map<String, dynamic> json) => Contenedore(
        id: json["_id"],
        name: json["name"],
        nameByUser: json["name_by_user"],
        nroItems: json["nro_items"],
        maximumSpace: json["maximum_space"] == null ? null : json["maximum_space"],
        typeContainer: json[" type_container"] == null ? null : json[" type_container"],
        alquiler: json["alquiler"],
        usuario: json["usuario"],
        assignUser: json["assign_user"],
        espacioMximo: json["espacio_máximo"] == null ? null : json["espacio_máximo"],
        tipoContenedor: json["tipo_contenedor"] == null ? null : json["tipo_contenedor"],
        asignarUsuario: json["asignar_usuario"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "name_by_user": nameByUser,
        "nro_items": nroItems,
        "maximum_space": maximumSpace == null ? null : maximumSpace,
        " type_container": typeContainer == null ? null : typeContainer,
        "alquiler": alquiler,
        "usuario": usuario,
        "assign_user": assignUser,
        "espacio_máximo": espacioMximo == null ? null : espacioMximo,
        "tipo_contenedor": tipoContenedor == null ? null : tipoContenedor,
        "asignar_usuario": asignarUsuario,
    };
}
