import 'package:flutter/material.dart';

class AddZonePage extends StatefulWidget {
  @override
  _AddZonePageState createState() => _AddZonePageState();
}

class _AddZonePageState extends State<AddZonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona de Riesgo'),
      ),
      body:SingleChildScrollView(
        child: Form(  
          child: Column(
            children: [
              SizedBox(height:70.0,),
              _claveIEGEM(),
              SizedBox(height:70.0,),
              _desastre(),
              SizedBox(height:70.0,),
              _submit(context)
            ],
          ),   
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

  Widget _desastre(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 45.0),
    child: TextFormField(
      decoration: InputDecoration(
        counterText: 'Desastre',
        icon: Icon(Icons.whatshot)
      ),
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