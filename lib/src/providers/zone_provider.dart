import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:municipios_crud/src/models/zona_models.dart';

class ZonaProvider{

  final String _url = 'https://municipiocrud.firebaseio.com/';

  Future<bool> crearZona(ZonaModel zonaModel) async {
    final url ='$_url/zonas.json';

    final resp = await http.post(url,body: zonaModelToJson(zonaModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ZonaModel>> cargarZona() async {
    final url ='$_url/zonas.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<ZonaModel> zona = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, zon) { 

      final zonTemp= ZonaModel.fromJson(zon);
      zonTemp.id=id;

      zona.add(zonTemp);

    });

    print(zona);

    return zona;
  }

  Future<int> borrarZon(String id) async {
    final url ='$_url/zonas/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarZon(ZonaModel zonaModel) async {
    final url ='$_url/zonas/${zonaModel.id}.json';

    final resp = await http.put(url,body: zonaModelToJson(zonaModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}