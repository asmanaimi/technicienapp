
import 'package:flutter/material.dart';
import 'package:technicienapp/NetworkHandler.dart';
import 'package:technicienapp/models/AddOrdoModel.dart';
import 'package:technicienapp/models/globalmodel.dart';
import 'package:technicienapp/pages/OrdoCard.dart';

import 'package:technicienapp/models/AddStatusTechnicien.dart';


class Ordonnances extends StatefulWidget {
  Ordonnances({Key key, this.url}) : super(key: key);
  final String url;
   
 
  @override
  _OrdonnancesState createState() => _OrdonnancesState();
}

class _OrdonnancesState extends State<Ordonnances> {
 
  NetworkHandler networkHandler = NetworkHandler();
                 AddOrdoModel addOrdoModel = AddOrdoModel();

globalmodel globalModel = globalmodel();
  List<AddOrdoModel> data = [];
  String errorText;
  bool validate = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

 void fetchData() async {
    var response = await networkHandler.get(widget.url);
    globalModel  = globalmodel.fromJson(response);
   // addOrdoModel =AddOrdoModel.fromJson(response);
    setState(() {
      data = globalModel.data;
   
    }
    );
  }

 /*void fetchData() async {

    var response = await networkHandler.get(widget.url);
    setState(() {
      globalModel  = globalmodel.fromJson(response["data"]);
    });
  }*/
  
   
  @override
  Widget build(BuildContext context) {
  
  
    return data.length > 0
        ? Column(
            children: data
                .map((item) => Column(
                      children: <Widget>[
                        InkWell(
                          
                          onTap: () async {
                         
                          },
                         
                          child: OrdoCard(
                            addOrdoModel: item,
                            networkHandler: networkHandler,
                          ),

                          
                        ),
                  
                        SizedBox(
                          height: 0,
                        ),
/*IconButton(
                icon: Icon(Icons.check),
             
                 
                onPressed: () {
            //   _confirmDialog();
            //  _sendNotif();
             //  _onDelete();
                },
            
                
            
                color: Color(0xFF27313B),
                  iconSize: 10,
                   padding:EdgeInsets.only(bottom:50)
                  
            ),*/
                     ],
                    ))
                .toList(),
          )
        : Center(
            child: Text("Vous n'avez pas des ordonnances"),
          );
  }}
  
