import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:municipios_crud/src/models/municipio_models.dart';

class MunProvider{

  final String _url = 'https://municipiocrud.firebaseio.com/';

  Future<bool> crearMun(MunicioModel municioModel) async {
    final url ='$_url/municipios.json';

    final resp = await http.post(url,body: municioModelToJson(municioModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<MunicioModel>> cargarMunicipio() async {
    final url ='$_url/municipios.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<MunicioModel> municipio = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, mun) { 

      final munTemp= MunicioModel.fromJson(mun);
      munTemp.id=id;

      municipio.add(munTemp);

    });

    print(municipio);

    return municipio;
  }

  Future<int> borrarMun(String id) async {
    final url ='$_url/municipios/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarMun(MunicioModel municioModel) async {
    final url ='$_url/municipios/${municioModel.id}.json';

    final resp = await http.put(url,body: municioModelToJson(municioModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}