import 'package:flutter/material.dart';

class ZonePage extends StatefulWidget {
  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Zonas de Riesgo'),
        actions: [
          IconButton(
            icon: Icon(Icons.mode_outlined,color: Colors.green,),
            onPressed: ()=> Navigator.pushNamed(context, 'modifyZone'),
          ),
        ],
      ),
    );
  }
}