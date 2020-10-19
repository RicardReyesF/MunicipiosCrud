
import 'package:flutter/material.dart';
import 'package:municipios_crud/src/models/municipio_models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipios_crud/src/providers/mun_provider.dart';


class MapaPageM extends StatefulWidget {
  @override
  _MapaPageMState createState() => _MapaPageMState();
}

class _MapaPageMState extends State<MapaPageM> {
final munProvider= new MunProvider(); 
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
          title: Text('Maps in Flutter'),
          centerTitle: true,
           actions: [

            IconButton(
            icon:Icon(Icons.system_update) , 
            onPressed: (){
              munProvider.editarMun(municioModel);
              Navigator.popAndPushNamed(context, 'home');
            },
            
            )
          ],
          
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
              onTap: _handelTap,
              
            ),
          ],
        )
      );
  

    }

         

    _handelTap(LatLng tappedPoint){
        setState(() {
          _mymarker=[];
          print(municioModel.localizacion);
          print(municioModel.getLonLat()); 
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

      
  

