import 'dart:convert';
import 'package:latlong/latlong.dart';

MunicioModel municioModelFromJson(String str) => MunicioModel.fromJson(json.decode(str));

String municioModelToJson(MunicioModel data) => json.encode(data.toJson());

class MunicioModel {
    MunicioModel({
        this.id,
        this.nomMun,
        this.sigMun,
        this.cabeceraMun,
        this.superficie,
        this.altitud,
        this.mainAsp,
        this.clima,
        this.localizacion,
    });

    String id;
    String nomMun;
    String sigMun;
    String cabeceraMun;
    String superficie;
    String altitud;
    String mainAsp;
    String clima;
    String localizacion;

    factory MunicioModel.fromJson(Map<String, dynamic> json) => MunicioModel(
        id: json["id"],
        nomMun: json["nomMun"],
        sigMun: json["sigMun"],
        cabeceraMun: json["cabeceraMun"],
        superficie: json["superficie"],
        altitud: json["altitud"],
        mainAsp: json["mainAsp"],
        clima: json["clima"],
        localizacion: json["localizacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nomMun": nomMun,
        "sigMun": sigMun,
        "cabeceraMun": cabeceraMun,
        "superficie": superficie,
        "altitud": altitud,
        "mainAsp": mainAsp,
        "clima": clima,
        "localizacion": localizacion,
    };
    LatLng getLonLat(){
      final lonlat=localizacion.substring(4).split(',');
        final lat=double.parse(lonlat[0]);
        final long =double.parse(lonlat[1]);
        return LatLng(lat,long);

    }
}
    
