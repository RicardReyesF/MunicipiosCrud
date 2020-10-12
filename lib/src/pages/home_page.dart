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
            icon: Icon(Icons.mode_outlined),
            onPressed: ()=> Navigator.pushNamed(context, 'modify'),
          ),   
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