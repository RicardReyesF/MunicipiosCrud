import 'package:flutter/material.dart';
import 'package:municipios_crud/src/pages/modify_page.dart';
import 'package:municipios_crud/src/pages/modify_page_zone.dart';

class HomeUser extends StatefulWidget {
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
   int  currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MunicipioUsers'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.red,),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login')
          ) 
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _botoNavigation(),
    );
  }

  Widget _botoNavigation(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex=index;
        });
      },
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Municipios')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.motorcycle),
          title: Text('Zonas')
        )
      ] 
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return ModifyPage();
      case 1: return ModifyZonePage();
      default: return ModifyPage();
    }
  }
}