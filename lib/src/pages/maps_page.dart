import 'dart:async';
import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
CameraPosition _initialPosition = CameraPosition(target: LatLng(19.294099,-99.701254),zoom: 11.0);
List<Marker> _mymarker=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps in Flutter'),
          centerTitle: true,
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
          print(tappedPoint);
          _mymarker.add(Marker(
            markerId: MarkerId(tappedPoint.toString()), 
            position: tappedPoint
          )
          );
        });
      }

      
  
}
