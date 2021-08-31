
import 'package:flutter/material.dart';
import 'package:technicienapp/models/AddOrdoModel.dart';
import 'package:technicienapp/pages/ordonnances.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
               AddOrdoModel addOrdoModel = AddOrdoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEFF),
      body: 
      SingleChildScrollView(
       child: Ordonnances(

  url: "/ordonnances/getownordo"
              ),
      ),
 
    );
  }
}

