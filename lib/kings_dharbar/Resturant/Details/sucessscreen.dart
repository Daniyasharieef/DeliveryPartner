import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kings_dharbar1/kings_dharbar/User/MainScreen.dart';


class Sucessscreen extends StatefulWidget {
  @override
   String _email;
  Sucessscreen(this._email);

  @override
  State<StatefulWidget> createState() {

    return SucessscreenState(this._email);
  }
}

class SucessscreenState extends State<Sucessscreen>
    with SingleTickerProviderStateMixin {

  String _email;

  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  SucessscreenState(this._email);

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Profilepages(_email)));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
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
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/image/success.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
              new Text(
                "Verified",
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xFF56C565)),
              ),
              new Text(
                "Your details are Sucessfully Verified...",
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xFF061508)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}