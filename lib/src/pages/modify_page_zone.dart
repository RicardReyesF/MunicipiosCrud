import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/zona_models.dart';
import 'package:municipios_crud/src/providers/zone_provider.dart';

class ModifyZonePage extends StatefulWidget {
  @override
  _ModifyZonePage createState() => _ModifyZonePage();
}

class _ModifyZonePage extends State<ModifyZonePage> {
  final zonaProvider= new ZonaProvider();
  ZonaModel zonaModel = new ZonaModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crearlistado(),
    );
    
  }
  Widget _crearlistado(){
    return FutureBuilder(
      future: zonaProvider.cargarZona(),
      builder: (BuildContext context,AsyncSnapshot<List<ZonaModel>>snapshot){
        if (snapshot.hasData) {
          final equipos= snapshot.data; 
          return ListView.builder(
            itemCount: equipos.length,
            itemBuilder: (context,i) => _crearItem(equipos[i],context),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(), 
          );
        }
      }
    );
  }

  Widget _crearItem(ZonaModel zonaModel,BuildContext context){
    return Dismissible( 
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed:(direction){
        zonaProvider.borrarZon(zonaModel.id);
      } ,
          child: ListTile(
            title: Text('${zonaModel.dNat}'),
            subtitle: Text('${zonaModel.id}'),
             
            
      ),
    );
  }
}