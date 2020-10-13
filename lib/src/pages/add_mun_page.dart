import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMunPage extends StatefulWidget {
  @override
  _AddMunPageState createState() => _AddMunPageState();
}

class _AddMunPageState extends State<AddMunPage> {
  @override
  Widget build(BuildContext context) {
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
      decoration: InputDecoration(
        counterText: 'Clave IGECEM',
        icon: Icon(Icons.vpn_key_outlined)
      ),
    ),
  );
}

Widget _municipio(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.home),
        counterText: 'Municipio'
      ),
    ),
  );
}

Widget _significado(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.local_library),
        counterText: 'Significado'
      ),
    ),
  );
}

Widget _cabeceraM(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.map_sharp),
        counterText: 'Cabecera Municipal'
      ),
    ),
  );
}

Widget _superficie(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.nature_people),
        counterText: 'Superficie'
      ),
    ),
  );
}

Widget _altitud(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.landscape),
        counterText: 'Altitud'
      ),
    ),
  );
}

Widget _clima(){
  String dropdownValue = 'Calido';
  return Container(
    padding: EdgeInsets.only(left: 215.0),
    child: DropdownButton<String>(
        value: dropdownValue,

        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Calido', 'Semicalido', 'Seco', 'Templado','Semifrio','Frio']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
  );
 } 
 Widget _submit(BuildContext context){
   return RaisedButton.icon(
      onPressed: ()=>Navigator.pushNamed(context, 'home'),
      icon: Icon(Icons.save_sharp,color: Colors.white,),
      label: Text('Guardar',style: TextStyle(color: Colors.white),),
      color: Colors.blue,
      shape: RoundedRectangleBorder() ,
    );
 }
}

