import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:TeamsPage(
          ),

        ));
  }
}

class Contact {
  final String name, mobile;

  Contact(this.name, this.mobile);
}

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<TeamsPage> {
  int _counter = 0;
  List words = [
    Contact("1.John Doe", "+91 9658245236"),
    Contact("2.Matt Brittin", "+91 9658245236"),
    Contact("3.Mark William", "+91 9658245236"),
    Contact("4.Adam Jones ", "+91 9658245236"),
    Contact("5.Serina William", "+91 9658245236"),
    Contact("6.Kate William", "+91 9658245236"),
  ];


  @override
  void initState() {
    super.initState();
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child:
        ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text(
                    "Restuarnts Around You ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight:FontWeight.bold,color: Colors.black),
                    textAlign: TextAlign.center,
                  ),

                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(15),
                          itemCount: words.length,
                          itemBuilder: (context, index) {
                            return  Card(
                              shadowColor: Colors.white60,
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Container(padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [   const FittedBox(
                                          fit: BoxFit.contain, child:
                                        Center(
                                          child: Image(
                                            image: AssetImage("assets/foodres.jpg"),
                                          ),
                                        ),
                                        ),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                              children: const [
                                                SizedBox(height: 10), Center(
                                                  child: Text(
                                                    "Hotel Name",
                                                    style: TextStyle(
                                                        fontSize: 20, color: Colors.black),
                                                  ),
                                                ), SizedBox(height: 10),
                                                SizedBox(height: 10),
                                                Center(
                                                  child: Text(
                                                    "Item ",
                                                    style: TextStyle(
                                                        fontSize: 20, color: Colors.black),
                                                  ),
                                                ),
                                                Text(
                                                  "Item ",
                                                  style: TextStyle(
                                                      fontSize: 20, color: Colors.black),
                                                ),]),
                                                IconButton(
                                                    color:  Color(0xFFA90725),
                                                    icon: Icon(
                                                        Icons.add,),
                                                    onPressed: () { _incrementCounter;}
                                                ),
                                                 Text(  '$_counter', style: TextStyle(
                                                    fontSize: 20, color: Colors.black),),
                                                const SizedBox(height: 10),
                                              ]),
                                    ));
                          }))
                ] ))));

  }
}



