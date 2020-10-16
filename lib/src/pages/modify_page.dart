
import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:municipios_crud/src/providers/mun_provider.dart';

class ModifyPage extends StatefulWidget {
  @override
  _ModifyPageState createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  final municioProvider = new MunProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crearlistado(),
    );
  }

   Widget _crearlistado(){
    return FutureBuilder(
      future: municioProvider.cargarMunicipio(),
      builder: (BuildContext context,AsyncSnapshot<List<MunicioModel>>snapshot){
        if (snapshot.hasData) {
          final municipios= snapshot.data; 
          return ListView.builder(
            itemCount: municipios.length,
            itemBuilder: (context,i) => _crearItem(municipios[i],context),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(), 
          );
        }
      }
    );
  }

  Widget _crearItem(MunicioModel municioModel,BuildContext context){
    return Dismissible( 
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed:(direction){
        municioProvider.borrarMun(municioModel.id);
      } ,
          child: ListTile(
            title: Text('${municioModel.nomMun}-${municioModel.sigMun}'),
            subtitle: Text('${municioModel.id}-${municioModel.mainAsp}'),
      ),
    );
  }
}