import 'dart:convert';

import 'package:http/http.dart' as http;


class UserProvider{
  final String _apiKey='';

  Future nuevoUsuario(String email,String password) async {
    final autData = {
      'email'             : email,
      'password'          : password,
      'returnSecureToken' : true
    };

final resp= await http.post('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apiKey',
    body: json.encode(autData),
  );
  Map<String,dynamic> decodedResp = json.decode(resp.body);

  if(decodedResp.containsKey('idtoken')){
    return {'ok':true,'token':decodedResp['idToken']};
  }else{
    return {'ok':false,'mensaje':decodedResp['error']['menssage']};
  }
  
}

}