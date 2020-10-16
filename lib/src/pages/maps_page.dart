import 'dart:async';
import 'package:flutter/material.dart';
import 'package:municipios_crud/src/bloc/provider.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipios_crud/src/providers/mun_provider.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  
  MunicioModel municioModel = new MunicioModel();
CameraPosition _initialPosition = CameraPosition(target: LatLng(19.294099,-99.701254),zoom: 11.0);
List<Marker> _mymarker=[];

  @override
  Widget build(BuildContext context) {
    final MunicioModel equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      municioModel = equiData;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps in Flutter'),
          centerTitle: true,
           actions: [

            IconButton(
            icon:Icon(Icons.arrow_forward_ios) , 
            onPressed: ()=>Navigator.pushNamed(context,'add',arguments: municioModel),
            
            )
          ],
          
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(   
              markers: Set.from(_mymarker),
              mapType: MapType.normal, 
              onMapCreated: (GoogleMapController controller) {},
              initialCameraPosition: _initialPosition,
              onTap: _handelTap,
              
            ),
          ],
        )
      );
  

    }
    _handelTap(LatLng tappedPoint){
        setState(() {
          _mymarker=[];
          print(tappedPoint);
          _mymarker.add(Marker(
            markerId: MarkerId(tappedPoint.toString()), 
            position: tappedPoint,
            //onTap: ()=>Navigator.popAndPushNamed(context, 'add',arguments: municioModel.localizacion=tappedPoint.toString()),
            
          )    
        );
      });
      final value = tappedPoint.toString();
      final newtappedPoint = value.replaceAll("LatLng", "").replaceAll("(", "").replaceAll(" ", "").replaceAll(")", "");
      print("value: $newtappedPoint");
      municioModel.localizacion=newtappedPoint;
      print(municioModel.localizacion);
    }
        
      
}

      
  

