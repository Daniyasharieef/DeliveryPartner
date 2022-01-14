import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:kings_dharbar1/kings_dharbar/User/Accountinfo/wishlist.dart';
import 'package:kings_dharbar1/kings_dharbar/User/OrderList/orderpage.dart';

import 'editprofile.dart';
import 'logout.dart';

class Accountview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:UserProfile("_email")
    );
  }
}



class UserProfile extends StatefulWidget {
  UserProfile(String _email);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool showCartIcon = true;
  String? name;
  String? mobileNumber;
  String? email;

  void setProfileDetails(context) async {
    dynamic args = ModalRoute.of(context)?.settings.arguments;
    this.setState(() {
      name = args['fullName'];
      mobileNumber = args['mobileNumber'];
    });
  }

  void initState() {
    super.initState();
    name = '';
    mobileNumber = '';
    email = '';
  }

  @override
  Widget build(BuildContext context) {
    setProfileDetails(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.red[800]?.withOpacity(
                        0.4,
                      ),
                      child: IconButton(
                        alignment: Alignment.topCenter,
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.red,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 60.0),
              ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    'Account Details',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35.0,
                  ),
                  onTap: () {}
                  // async{
                  // bool connectionStatus = await _userService.checkInternetConnectivity();
                  //
                  // if(connectionStatus){
                  // dynamic args = ModalRoute.of(context)?.settings.arguments;
                  // // String email = _userService.userEmail();
                  // args['email'] = email;
                  // Navigator.pushNamed(context, '/profile/edit',arguments: args);
                  // }
                  // else{
                  // internetConnectionDialog(context);
                  // }
                  // },
                  ),
              ListTile(
                  leading: Icon(
                    Icons.favorite,
                    size: 40.0,
                    color: Colors.red,
                  ),
                  title: Text(
                    'WishList',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35.0,
                  ),
                  onTap: () {WishList;}
                  // async{
                  // bool connectionStatus = await _userService.checkInternetConnectivity();
                  //
                  // if(connectionStatus){
                  // Loader.showLoadingScreen(context, _keyLoader);
                  // List userList = await _userService.userWishlist();
                  // Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                  // Navigator.pushNamed(context, '/wishlist',arguments: {'userList':userList});
                  // }
                  // else{
                  // internetConnectionDialog(context);
                  // }
                  // },
                  ),
              ListTile(
                  leading: const Icon(
                    Icons.fastfood,
                    size: 40.0,
                  ),
                  title: Text(
                    'Order History',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 35.0,
                  ),
                  onTap: () {OrderHistory;}
                  // async{
                  // bool connectionStatus = await _userService.checkInternetConnectivity();
                  //
                  // if(connectionStatus){
                  // Loader.showLoadingScreen(context, _keyLoader);
                  // List orderData = await _checkoutService.listPlacedOrder();
                  // Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                  // Navigator.popAndPushNamed(context, '/placedOrder',arguments: {'data': orderData});
                  // }
                  // else{
                  // internetConnectionDialog(context);
                  // }
                  // },
                  ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 40.0,
                  color: Colors.grey,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 35.0,
                ),
                onTap: () {Editprofile;},
                // async{
                // bool connectionStatus = await _userService.checkInternetConnectivity();
                //
                // if(connectionStatus){
                // Navigator.of(context).pushNamed('/profile/settings', arguments: userSettings.docs[0].data);
                // }
                // else{
                // internetConnectionDialog(context);
                // }
                //
                // },
              ),

              SizedBox(height: 30.0),
              ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {LogOutPage;
                      // _userService.logOut(context);
                    },
                    color: Colors.white,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black26, width: 2.0),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

void internetConnectionDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            height: 300,
            // width: 100,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.signal_wifi_off,
                    size: 60.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Oops!',
                      style: TextStyle(
                        fontFamily: 'NovaSquare',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'No internet connection found',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'Check your connection',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

// class Userdata {
//
//   String userFirstName;
//   String userLastName;
//   String userEmail;
//
//   Userdata({
//
//     required this.userFirstName,
//     required this.userLastName,
//     required this.userEmail
//   });
//
//   factory Userdata.fromJson(Map<String, dynamic> json) {
//     print(json['Hwappy_Name']);
//     return Userdata(
//         userFirstName: json['Hwappy_Name'],
//         userLastName: json['Hwappy_Name'],
//         userEmail: json['Hwappy_Email_Id']
//     );
//   }
// }

// class _ProfilePageState extends State<Accountview>{
//
//   bool checkBoxValue = false;
//   late double _height;
//   late double _width;
//   late double _pixelRatio;
//   late bool _large;
//   late bool _medium;
//
//   late String _email ;
//
//   Future<Null> getSharedPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("email");
//     setState(() {
//       _email =  prefs.getString("counter")!;
//       print(_email);
//     });
//
//   }
//
//   @override
//   void initState() {
//     print("ini");
//     super.initState();
//     _email = "";
//     getSharedPrefs();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     _height = MediaQuery.of(context).size.height;
//     _width = MediaQuery.of(context).size.width;
//     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
//     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
//     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
//
//     return Material(
//       child: Scaffold(
//         body: Container(
//           height: _height,
//           width: _width,
//           margin: EdgeInsets.only(bottom: 5),
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Opacity(opacity: 0.88,child:  AppBar(
//                     leading: IconButton(
//                          icon: Icon(Icons.arrow_back,color: Colors.white),
//                      onPressed: () {
//                        Navigator.push(
//                            context, MaterialPageRoute(builder: (_) => Profilepages(_email)));
//                      },
//                            ),
//                       backgroundColor: Color(0xFFA90725),
//                       elevation: 0,
//                    title: Text("My Account"),
//                    actions: <Widget>[
//
//                     ],
//                  ),),
//                 clipShape(),
//                 firstname(),
//                 lastname(),
//                 emailid(),
//                 SizedBox(height: _height / 12),
//                 button(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget clipShape() {
//     return Stack(
//       children: <Widget>[
//         Opacity(
//           opacity: 0.75,
//           child: ClipPath(
//             clipper: CustomShapeClipper(),
//             child: Container(
//               height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFD3032A), Color(0xFFCE8B98)],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: 0.5,
//           child: ClipPath(
//             clipper: CustomShapeClipper2(),
//             child: Container(
//               height: _large? _height/12 : (_medium? _height/11 : _height/10),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFD3032A), Color(0xFFCE8B98)],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget firstname() {
//     return Container(child:
// Text("name"),
//       // child: FutureBuilder<List<Userdata>>(
//       //   // future: fetchStudent(),
//       //   builder: (context, snapshot) {
//       //
//       //     if (!snapshot.hasData) return Center(
//       //         child: CircularProgressIndicator()
//       //     );
//       //     return ListView(
//       //       scrollDirection: Axis.vertical,
//       //       shrinkWrap: true,
//       //       children: snapshot.data!
//       //           .map((data) => Row(children: <Widget>[
//       //         GestureDetector(
//       //           child: Row(
//       //               crossAxisAlignment: CrossAxisAlignment.center,
//       //               children: [
//       //                 Padding(
//       //                     padding: EdgeInsets.fromLTRB(80, 10, 5, 10),
//       //                     child: Text("Name",
//       //                         style: TextStyle(fontSize: 20,fontStyle: FontStyle.normal,color: Color(0xFF3F3C3D)),
//       //                         textAlign: TextAlign.left))
//       //
//       //               ]),),
//       //         Padding(
//       //             child: Text(
//       //               data.userFirstName,
//       //               style: new TextStyle(fontSize: 20,fontStyle: FontStyle.normal,color: Color(0xFF3F3C3D)),
//       //               textAlign: TextAlign.right,
//       //             ),
//       //             padding: EdgeInsets.all(2.0)),
//       //       ],))
//       //           .toList(),
//       //     );
//       //   },
//       // ),
//     );
//   }
//
//   Widget lastname() {
//     return Container(
//       child:
//       Text("name"),
//     );
//   }
//   Widget emailid() {
//     return Container(child:
//       Text("name"),
//       // child: FutureBuilder<List<Userdata>>(
//       //   // future: fetchStudent(),
//       //   builder: (context, snapshot) {
//       //
//       //     if (!snapshot.hasData) return Center(
//       //         child: CircularProgressIndicator()
//       //     );
//       //     return ListView(
//       //       scrollDirection: Axis.vertical,
//       //       shrinkWrap: true,
//       //       children: snapshot.data!
//       //           .map((data) => Row(children: <Widget>[
//       //         GestureDetector(
//       //           child: Row(
//       //               crossAxisAlignment: CrossAxisAlignment.center,
//       //               children: [
//       //                 Padding(
//       //                     padding: EdgeInsets.fromLTRB(80, 10,5, 10),
//       //                     child: Text("Email-Id",
//       //                         style: TextStyle(fontSize: 20,fontStyle: FontStyle.normal,color: Color(0xFF3F3C3D)),
//       //                         textAlign: TextAlign.left))
//       //
//       //               ]),),
//       //         Padding(
//       //             child: Text(
//       //               data.userEmail,
//       //               style: new TextStyle(fontSize: 20,fontStyle: FontStyle.normal,color: Color(0xFF3F3C3D)),
//       //               textAlign: TextAlign.left,
//       //             ),
//       //             padding: EdgeInsets.all(2.0)),
//       //       ],))
//       //           .toList(),
//       //     );
//       //   },
//       // ),
//     );
//   }
//
//
//
//   Widget button() {
//     return RaisedButton(
//       elevation: 0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//       onPressed: () {
//
//       },
//       textColor: Colors.white,
//       padding: EdgeInsets.all(0.0),
//       child: Container(
//         alignment: Alignment.center,
// //        height: _height / 20,
//         width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           gradient: LinearGradient(
//             colors: <Color>[Color(0xFF9B0437), Color(0xFF9B0437)],
//           ),
//         ),
//         padding: const EdgeInsets.all(12.0),
//         child: Text('SIGN UP', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
//       ),
//     );
//   }
//}
