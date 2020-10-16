import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:municipios_crud/src/providers/mun_provider.dart';

class AddMunPage extends StatefulWidget {
  @override
  _AddMunPageState createState() => _AddMunPageState();
}

class _AddMunPageState extends State<AddMunPage> {
  final formKey = GlobalKey<FormState>();
  final munProvider= new MunProvider();
  MunicioModel municioModel= new MunicioModel();

  @override
  Widget build(BuildContext context) {
    final MunicioModel equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      municioModel = equiData;
      
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo municipio'),
        actions: [
          IconButton(
            icon: Icon(Icons.warning_amber_rounded,color: Colors.red,),
            onPressed: ()=> Navigator.pushNamed(context, 'zoneAdd')
          )   
        ],
      ),
      body: SingleChildScrollView(
      child: Form( 
        key: formKey, 
        child: Column(
          children: [
            SizedBox(height:70.0,),
            _claveIEGEM(),
            SizedBox(height:70.0,),
            _municipio(),
            SizedBox(height:70.0,),
            _significado(),
            SizedBox(height:70.0,),
            _cabeceraM(),
            SizedBox(height:70.0,),
            _superficie(),
            SizedBox(height:70.0,),
            _altitud(),
            SizedBox(height:70.0,),
            _principalesAsp(),
            SizedBox(height:70.0,),
            _clima(),
            SizedBox(height:70.0,),
            _submit(context)
          ],
        )   
      ),
    ),
  );
}

Widget _claveIEGEM(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        counterText: 'Clave IGECEM',
        icon: Icon(Icons.vpn_key_outlined)
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.id = value
    ),
  );
}

Widget _municipio(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.home),
        counterText: 'Municipio'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.nomMun = value
    ),
  );
}

Widget _significado(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.local_library),
        counterText: 'Significado'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.sigMun = value
    ),
  );
}

Widget _cabeceraM(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.map_sharp),
        counterText: 'Cabecera Municipal'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.cabeceraMun = value
    ),
  );
}

Widget _superficie(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.nature_people),
        counterText: 'Superficie'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.superficie = value
    ),
  );
}

Widget _altitud(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.landscape),
        counterText: 'Altitud'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.altitud = value ,
    ),
  );
}

Widget _clima(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.landscape),
        counterText: 'Clima'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value) =>municioModel.clima = value ,
    ),
  );
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            



Widget _principalesAsp(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      initialValue: '',
      decoration: InputDecoration(
        icon: Icon(Icons.priority_high_rounded),
        counterText: 'Principales Aspctos'
      ),
      validator: (value){
        if(value.length < 3){
          return 'Demasiado corto';
        }else{
          return null;
        }
      },
      onSaved: (value)=> municioModel.mainAsp = value,
    ),
  );
}


 Widget _submit(BuildContext context){
   return RaisedButton.icon(
      onPressed: _submit1,
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
    if(municioModel.id== null){
      munProvider.crearMun(municioModel);
    }else{
      munProvider.editarMun(municioModel);
    }
   
   
   Navigator.popAndPushNamed(context, 'home');
 }
}

