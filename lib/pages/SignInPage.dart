 
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import 'package:technicienapp/NetworkHandler.dart';
import 'package:technicienapp/pages/ForgotPassword.dart';
import 'package:technicienapp/pages/HomePage.dart';



class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
   bool vis = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
    TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  String errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              
              
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                           
                      Image.asset('assets/logo3.png',
        height: 100,
        width: 110,
                       // color: Colors.white,

        ),
                      
                      SizedBox(
                        height: 20,
                      ),
                    
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF69F0AE), Color(0xFF00E676)])),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Form(
             
          key: _globalkey,
                      child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: 
              
 Material(
      elevation: 2.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: TextFormField(
      controller: _emailController,
    validator: (value) {
    if (value.isEmpty) return "Email can't be empty";
    if (!value.contains("@")) return "Email is Invalid";
    return null;
            },
        onChanged: (String value){},
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
          errorText: validate ? null : errorText,
            hintText: "Email",
            prefixIcon: Material(
              elevation: 0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Icon(
                Icons.email,
                 color: Colors.greenAccent[400],
              ),
            ),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
      ),
    ),                 
            ),
          ),
          SizedBox(
            height: 20,
          ),
         Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                onChanged: (String value){},
                cursorColor: Colors.deepOrange,
              controller: _passwordController,
           validator: (value) {
              if (value.isEmpty) return "Password can't be empty";
              return null;
            },
          obscureText: vis,
          decoration: InputDecoration(
            errorText: validate ? null : errorText,
                    hintText: "Password",
                    
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Colors.greenAccent[400],
                      ),
                    ),
                    suffixIcon: IconButton(
                        color: Colors.greenAccent[400],
              icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  vis = !vis;
                });
              },
            ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                     color: Colors.greenAccent[400],),
                child: FlatButton(
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                         color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                   onPressed: () async {
                     setState(() {
                      circular = true;
                    });
                      //await checkUser();
                 // if (_globalkey.currentState.validate() && validate) {
                    Map<String, String> data = {
                      "email": _emailController.text,
                      "password": _passwordController.text,
                    };

                    var response =
                        await networkHandler.post("/techniciens/authtechnicien", data);

                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      Map<String, dynamic> output = json.decode(response.body);
                     
                    
                      print(output["token"]);
                     
                      await storage.write(key: "token", value: output["token"]);
                      setState(() {
                        validate = true;
                        circular = false;
                      });
                        if (output["token"] != null) {  
                   
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    
                        }  
                       
                        }
                    else {
                      String output = json.decode(response.body);
                      setState(() {
                        validate = false;
                        errorText = output;
                        circular = false;
                      });
                    }
                  //  }
                  },
                ),
                   
              )),
              SizedBox(height: 20,),
       InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      },
         
            child: Center(child: Text("mot de passe oublié(e) ?", style: TextStyle( color: Colors.greenAccent[400],fontSize: 12 ,fontWeight: FontWeight.w700),)),
          
       ),
    
        ],
      ),
    );
  }


 

 
 

}


class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  
}

 
  
