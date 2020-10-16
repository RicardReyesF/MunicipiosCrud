import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:municipios_crud/src/providers/mun_provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final municioProvider = new MunProvider();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerta Municipio'),
        actions:<Widget>[
        IconButton(
            icon: Icon(Icons.warning_amber_rounded,color: Colors.red,),
            onPressed: ()=> Navigator.pushNamed(context, 'zone')
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.red,),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login')
          )    
        ],
      ),
      body: _crearlistado(),
      floatingActionButton: _getFab()//_floatinbutton(context),
    );
  }
/*
  Widget _floatinbutton(BuildContext context){
    return FloatingActionButton(
      onPressed: ()=>Navigator.pushNamed(context,'maps'),
      child: Icon(Icons.add_circle_sharp),
    );
  }
*/
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
            onTap: ()=> Navigator.pushNamed(context,'maps',arguments: municioModel)
      ),
    );
  }

  Widget _getFab(){
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add_circle_sharp),
          onTap:()=> Navigator.popAndPushNamed(context, 'maps'),
          label: 'añadir municipio',
          ),
        SpeedDialChild(
            onTap: ()=> Navigator.popAndPushNamed(context,'zoneAdd'),
            child: Icon(Icons.warning_amber_rounded),
            label: 'añadir zona',
        )
      ],

    );
  }

}