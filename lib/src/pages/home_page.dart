import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerta Municipio'),
        actions:<Widget>[
        IconButton(
            icon: Icon(Icons.mode_outlined,color: Colors.green,),
            onPressed: ()=> Navigator.pushNamed(context, 'modify'),
          ),
        IconButton(
            icon: Icon(Icons.warning_amber_rounded,color: Colors.red,),
            onPressed: ()=> Navigator.pushNamed(context, 'zone')
          )    
        ],
      ),
      floatingActionButton: _floatinbutton(context),
    );
  }

  Widget _floatinbutton(BuildContext context){
    return FloatingActionButton(
      onPressed: ()=>Navigator.pushNamed(context,'add'),
      child: Icon(Icons.add_circle_sharp),
    );
  }
}