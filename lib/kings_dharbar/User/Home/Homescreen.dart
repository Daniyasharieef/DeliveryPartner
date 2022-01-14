import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kings_dharbar1/kings_dharbar/User/Categories/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  TextEditingController editingController = TextEditingController();
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
                  TextField(
                    cursorWidth: 10,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 10),
                    controller: editingController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: ""),
                  ),
    const SizedBox(height: 10),
                 Text(
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
      child: InkWell(
    splashColor: Colors.orange,
    onTap: () {
      print("menu");
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Categories()));
      Container(padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 10), const Center(
                child: Text(
                  "Hotel Name",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black),
                ),
              ), const SizedBox(height: 10),
              const FittedBox(
                fit: BoxFit.contain, child:
              Center(
                child: Image(
                  image: AssetImage("assets/foodres.jpg"),
                ),
              ),
              ), const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Menu List ",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black),
                ),
              ),
              IconButton(
                  color: Colors.red,
                  icon: Icon(
                      Icons.favorite_outline_outlined, color: Colors.red),
                  onPressed: () {}
              ),
              const Text("549.5k", style: TextStyle(
                  fontSize: 20, color: Colors.black),),
              const SizedBox(height: 10),
            ]),
      );

    }  ),
    );
    }))
   ] ))));

  }
}



