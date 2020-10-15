import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:municipios_crud/src/models/usuarios_models.dart';

class UsuariosProvider{

  final String _url = 'https://municipiocrud.firebaseio.com/';

  Future<bool> crearUsuario(UsuarioModel usuariosModel) async {
    final url ='$_url/usuarios.json';

    final resp = await http.post(url,body: usuarioModelToJson(usuariosModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<UsuarioModel>> cargarUsuarios() async {
    final url ='$_url/usuarios.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<UsuarioModel> usuario = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, usu) { 

      final userTemp= UsuarioModel.fromJson(usu);
      userTemp.id=id;

      usuario.add(userTemp);

    });

    print(usuario);

    return usuario;
  }

  Future<int> borrarUsuario(String id) async {
    final url ='$_url/usuarios/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarUsuario(UsuarioModel usuarioModel) async {
    final url ='$_url/usuarios/${usuarioModel.id}.json';

    final resp = await http.put(url,body: usuarioModelToJson(usuarioModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}