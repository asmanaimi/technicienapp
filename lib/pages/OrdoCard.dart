import 'package:flutter/material.dart';
import 'package:technicienapp/NetworkHandler.dart';
import 'package:technicienapp/models/AddOrdoModel.dart';
import 'package:technicienapp/models/AddStatusTechnicien.dart';
import 'package:technicienapp/models/NotificationM.dart';
import 'package:technicienapp/pages/HomePage.dart';

class OrdoCard extends StatelessWidget {


  
  const  OrdoCard({Key key, this.addOrdoModel, this.networkHandler})
      : super(key: key);

  final AddOrdoModel addOrdoModel;
  final NetworkHandler networkHandler;

  @override
  Widget build(BuildContext context) {
   TextEditingController _status = TextEditingController();
   TextEditingController _statust = TextEditingController();

     List<String> etat = <String>[
    'non traitée',
    'en cours',
    'terminée',

  ];

    
 /*List<String> statustech = <String>[
    'disponible',
    
 ];*/
   Widget addButton() {
      return InkWell(
      onTap: () async {
              //  AddOrdoModel addOrdoModel = AddOrdoModel();

        AddOrdoModel addOrdoModel =
               AddOrdoModel(status:_status.text);
          var response = await networkHandler.patch2(
              "/techniciens/statustech/${addOrdoModel.technicien}",addOrdoModel.toJson());
          print(response.body);
   
      },
 

      child: Center(
          child: Container(
            height: 1,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.teal),
            child: Center(
                child: Text(
              "save status",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ),
        
      ),
    );
    
  }
  
  Widget etatTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child:         Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.black12,  //add it here
        ),
        
        child:    new PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          _status.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return etat.map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
      ),
    );
  }
   
 Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () async {
                             // AddOrdoModel addOrdoModel = AddOrdoModel();
 //  _sendNotif();
              

     
              networkHandler.delete1("/ordonnances/deleteordotech/${addOrdoModel.id}",addOrdoModel);  
 Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                          (route) => false);
              },
            ),              
            
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
   
   
    Future <void> _sendNotif()async
    
   { 
        
          NotificationM notifModel =
              NotificationM(title: addOrdoModel.email,body: addOrdoModel.medecin);
          var response = await networkHandler.post2(
              "/notification/send", notifModel.toJson());
          print(response);
        }
    

    return Container(
      height: 1000,
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
         children: <Widget>[
        Card(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: networkHandler.getImage(addOrdoModel.id),
                      fit: BoxFit.fill
                      ),
                ),
              ),
        
                
 
              
            ],
          ),
        ),
            
               
                    Center(
                      child: Row(
                        children: [
                          IconButton(
                          icon: Icon(Icons.delete),
                 
                           
                          onPressed: () async {
                   _confirmDialog();
                   
                
                          },
                
                          
                
                          color: Color(0xFF27313B),
                            iconSize: 10,
                            // padding:EdgeInsets.only(bottom:1)
                            
                ),
                       

                   
                 
              
              IconButton(
                icon: Icon(Icons.add_alert_rounded),
             
                 
                onPressed: () async {
               _sendNotif();
            
         
                },
            
                
            
                color: Color(0xFF27313B),
                  iconSize: 10,
                  // padding:EdgeInsets.only(bottom:1)
                  
            ),
           etatTextField() ,
 IconButton(
                icon: Icon(Icons.add),
             
                 
                onPressed: () async {
              
             AddOrdoModel addOrdoModell =
               AddOrdoModel(status:_status.text);
             
          var response = await networkHandler.patch2(
              "/ordonnances/saveetat/${addOrdoModel.id}",addOrdoModell.toJson());
          print(response.body);
          print(_status.text);

        
      
         
                },
            
                
            
                color: Color(0xFF27313B),
                  iconSize: 10,
                  // padding:EdgeInsets.only(bottom:1)
                  
            ),
             IconButton(
                icon: Icon(Icons.check),
             
                 
                onPressed: () async {
              
        
        AddStatusTechnicien addstatustechnicien =
                AddStatusTechnicien(status:_statust.text);

          var response = await networkHandler.patch2(
              "/techniciens/statustech/${addOrdoModel.technicien}",addOrdoModel.toJson());
          print(response.body);
         
                },
            
                
            
                color: Color(0xFF27313B),
                  iconSize: 10,
                  // padding:EdgeInsets.only(bottom:1)
                  
            ),
             ],
                      ),
                    ),
         ],
      ),
      
    );
  }
 

}