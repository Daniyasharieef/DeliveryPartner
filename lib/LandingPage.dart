import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Resturant/Details/signin.dart';
import 'User/Details/signin.dart';



class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
const
                      Text(
                        "Hotel Kings Dharbar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30,color: Color(0xFFCA1F39)),
                      ),
                  SizedBox(
                    height: 20,
                  ),

                      Text(
                        "Welcomes you all and make delicious..",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                ],
              ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/delivery.png'))),
                  ),
              Column(
                children: <Widget>[
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSignin()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFFCA1F39)),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login as Customer",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18,color: Colors.white),
                        ),
                      ),
                  SizedBox(
                    height: 20,
                  ),
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResturantSignin()));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFCA1F39)),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Login as Resturant",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18,color: Colors.white),
                          ),
                        ),
                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}