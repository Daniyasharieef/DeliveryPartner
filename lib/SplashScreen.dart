import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Introscreen.dart';
import 'User/MainScreen.dart';



class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  String msg='';
   String? email ;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }



  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("email");
    setState(() {
      email = (prefs.getString('counter') ?? "");
      print(email);
    });

  }

  
  void navigationPage()  {

     if (email==email) {
    //   //Navigator.pushNamed(context, '/login');
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Introscreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Profilepages(email!)));
    }

  }

  @override
  void initState() {
    super.initState();

    email = "";
    getSharedPrefs();

    animationController =  AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    animation =
     CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/image/ourlogo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              color: Color(0xFFCA1F39),),
              new Text(
                'Hwappy',
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xFFCA1F39)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}