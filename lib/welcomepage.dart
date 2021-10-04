

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:technicienapp/pages/SignInPage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (
              BuildContext context
              ) =>SignInPage())));
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
     //#2CD889
  backgroundColor: Colors.white,
        body: Column(
           crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
             SizedBox(
            height: 80,
          ),
            Lottie.asset('assets/p.json',
            width: 260,
            height: 350,
            ),
            
            Text(
                  "Préparer l'ordonnance et envoyer façilement au patient ",
                
                  style: TextStyle(
                      color: Color(0xFF69F0AE),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,),
                      textAlign: TextAlign.center,
                ),]
      ),
    );
  }

  
}