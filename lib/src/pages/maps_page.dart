import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:latlong/latlong.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();
  String tipoMap='streets-v11';
  @override
  Widget build(BuildContext context) {
    final MunicioModel mun = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas'),
        actions: [
          IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),
           onPressed: ()=>Navigator.pushNamed(context, 'add') 
          ),
        ],
      ),
      body: FlutterMap(
        mapController: map,
        options: MapOptions(
          zoom: 18,
          center: LatLng(19.2925699,-99.6575268),
        ),
        layers: [
          _crearMapBox(),
          _crearMarcador()
        ],
      ),
      );
      
  }

  _crearMapBox(){
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
      additionalOptions:{
        'accessToken':'pk.eyJ1IjoicmljYXJkb2Zlcm5hbmRleiIsImEiOiJja2RxbWYzZWkwNHJ3MnRscXBnbjN1enVyIn0.yVBnV7G_McbcVRa_GfsulQ',
        'id': 'mapbox/$tipoMap',
        
      } 
    

    );
  }

  _crearMarcador() {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          height: 100.0,
          width: 100.0,
          point: LatLng(19.2925699,-99.6575268),
          builder: (context) => Container(
            child: Icon(Icons.location_on,
            color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ], 
    );

  }

  

  
}