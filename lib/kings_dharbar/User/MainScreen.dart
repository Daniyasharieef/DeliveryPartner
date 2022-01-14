import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Accountinfo/accountview.dart';
import 'Categories/categories.dart';
import 'Home/Homescreen.dart';
import 'OrderList/orderpage.dart';


class Profilepages extends StatelessWidget {

  Profilepages(String _email);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Dashboard(),

    );
  }

}


class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard > with TickerProviderStateMixin{
  int _selectedIndex = 2;
String? email;

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("email");
    setState(() {
      email =  prefs.getString("counter")!;
      print(email);
    });

  }

  @override
  void initState() {
    print("ini");
    super.initState();
    email = "";
    getSharedPrefs();

  }



  final List<Widget> _children = <Widget>[
    HomeScreen (),
    Categories(),
    OrderHistory(),
    Accountview(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _children_title = <String>["Homepage",
      "Cateogry",
      "Order History",
      "My Account"
    ];
    return Scaffold(
      appBar :AppBar(
        title: Text(_children_title.elementAt(_selectedIndex)),
        backgroundColor: Color(0xFFA90725),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Profilepages(email!)));
            },
          ),
        ],
      ),
      body: Center(
        child: _children.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu,color: Colors.white),
                title: Text("Home"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded,color: Colors.white),
                title: Text("Categories"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.reorder,color: Colors.white),
                title: Text("Order History"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp,color: Colors.white),
                title: Text("Account Info"),
                backgroundColor: Color(0xFFA90725)),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}