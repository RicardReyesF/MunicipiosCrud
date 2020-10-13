import 'package:flutter/material.dart';
import 'package:municipios_crud/src/pages/add_mun_page.dart';
import 'package:municipios_crud/src/pages/home_page.dart';
import 'package:municipios_crud/src/pages/maps_page.dart';
import 'package:municipios_crud/src/pages/modify_page.dart';
import 'package:municipios_crud/src/pages/add_zone_page.dart';
import 'package:municipios_crud/src/pages/modify_page_zone.dart';
import 'package:municipios_crud/src/pages/zone_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'        : (BuildContext context) => HomePage(),
        'add'         : (BuildContext context) => AddMunPage(),
        'modify'      : (BuildContext context) => ModifyPage(),
        'zoneAdd'     : (BuildContext context) => AddZonePage(),
        'zone'        : (BuildContext context) => ZonePage(),
        'modifyZone'  : (BuildContext context) => ModifyZonePage(),
        'maps'        : (BuildContext context) => MapaPage()
      },
    );
  }
}