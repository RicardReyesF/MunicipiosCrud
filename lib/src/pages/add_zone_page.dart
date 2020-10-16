import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/zona_models.dart';
import 'package:municipios_crud/src/providers/zone_provider.dart';

class AddZonePage extends StatefulWidget {
  @override
  _AddZonePageState createState() => _AddZonePageState();
}

class _AddZonePageState extends State<AddZonePage> {
  final formKey = GlobalKey<FormState>();
  final zonaProvider = new ZonaProvider();
  ZonaModel zonaModel = new ZonaModel();
  @override
  Widget build(BuildContext context) {
    final ZonaModel equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      zonaModel = equiData;
      
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona de Riesgo'),
      ),
      body:SingleChildScrollView(
        child: Form(
          key: formKey,  
          child: Column(
            children: [
              SizedBox(height:70.0,),
              _claveIEGEM(),
              SizedBox(height:70.0,),
              _desastre(),
              SizedBox(height:70.0,),
              _submit(context)
            ],
          ),   
        ),
      ),
    );
  }

  Widget _claveIEGEM(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        counterText: 'Clave IGECEM',
        icon: Icon(Icons.vpn_key_outlined)
      ),
      validator: (value){
        if (value.length < 3) {
          return 'Clave corta';
        } else {
          return null;
        }
      },
      onSaved: (value ) => zonaModel.claveIg=value,
    ),
  );
}

  Widget _desastre(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        counterText: 'Desastre',
        icon: Icon(Icons.whatshot)
      ),
      validator: (value){
        if (value.length < 3) {
          return 'Texto cort0';
        } else {
          return null;
        }
      },
      onSaved: (value) => zonaModel.dNat=value,
    ),
  );
}

  Widget _submit(BuildContext context){
   return RaisedButton.icon(
      onPressed: _submit1 ,
      icon: Icon(Icons.save_sharp,color: Colors.white,),
      label: Text('Guardar',style: TextStyle(color: Colors.white),),
      color: Colors.blue,
      shape: RoundedRectangleBorder() ,
    );
 }

 void _submit1(){
   if (!formKey.currentState.validate()) return;
    print('Todo ok');

    formKey.currentState.save();
    
    if(zonaModel.id== null){
      zonaProvider.crearZona(zonaModel);
    }else{
      zonaProvider.editarZon(zonaModel);
    }
   
   Navigator.popAndPushNamed(context,'home');
 }

}