import 'dart:convert';

ZonaModel zonaModelFromJson(String str) => ZonaModel.fromJson(json.decode(str));

String zonaModelToJson(ZonaModel data) => json.encode(data.toJson());

class ZonaModel {
    ZonaModel({
        this.id,
        this.claveIg,
        this.dNat,
    });

    String id;
    String claveIg;
    String dNat;

    factory ZonaModel.fromJson(Map<String, dynamic> json) => ZonaModel(
        id: json["id"],
        claveIg: json["claveIg"],
        dNat: json["dNat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "claveIg": claveIg,
        "dNat": dNat,
    };
}
