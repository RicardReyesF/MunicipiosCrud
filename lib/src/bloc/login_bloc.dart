
import 'package:municipios_crud/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class LoginBloc with Validators{
  final _controllerEmail      = BehaviorSubject<String>();
  final _controllerPassword   = BehaviorSubject<String>(); 
  final _controllerLocalizacion = BehaviorSubject<String>(); 

  //Insertar valores 
  Function(String) get changeEmail        => _controllerEmail.sink.add;
  Function(String) get changePassword     => _controllerPassword.sink.add;
  Function(String) get changeLocalizacion => _controllerLocalizacion.sink.add; 

  //CombinarStream
  Stream<bool> get formValidStream =>
       Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Recuperar Datos 

  Stream<String> get emailStream           => _controllerEmail.stream.transform(validarEmail);
  Stream<String> get passwordStream        => _controllerPassword.stream.transform(validarPassword);
  Stream<String> get localizacionStream    => _controllerLocalizacion.stream;

  // Obtener el último valor ingresado a los streams
  String get email    => _controllerEmail.value;
  String get password => _controllerPassword.value;
  String get localizacion => _controllerPassword.value;

  
  //Cerrar

  dispose(){
    _controllerEmail?.close();
    _controllerPassword?.close();
  }
}