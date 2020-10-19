
import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaPageView extends StatefulWidget {
  @override
  _MapaPageViewState createState() => _MapaPageViewState();
}

class _MapaPageViewState extends State<MapaPageView> {
  
MunicioModel municioModel = new MunicioModel();
List<Marker> _mymarker=[];


  @override
  Widget build(BuildContext context) {
    final MunicioModel equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      municioModel = equiData;
      print(municioModel.getLonLat());
      print(municioModel.localizacion);
    }
    CameraPosition _initialPosition = CameraPosition(target: municioModel.getLonLat(),zoom: 13.0);
    
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubicacion del Municipio'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(   
              markers: Set.from(_mymarker),
              mapType: MapType.normal, 
              onMapCreated: (GoogleMapController controller) {
                   setState(() {
         _mymarker.add(
            Marker(
               markerId: MarkerId(''),
               position: municioModel.getLonLat(),
               
            )
         );
      });      
              },
              initialCameraPosition: _initialPosition,
              
            ),
          ],
        )
      );
  

    }        
      
}

      
  

