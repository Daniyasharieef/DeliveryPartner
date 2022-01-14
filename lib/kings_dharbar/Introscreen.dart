import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'LandingPage.dart';
import 'app_startup_ui_widget.dart';





// ignore: must_be_immutable
class Introscreen extends StatelessWidget {
  // This widget is the root of your application.
  Map<int, Color> color = {
    50: const Color.fromRGBO(250, 202, 88, .1),
    100: const Color.fromRGBO(250, 202, 88, .2),
    200: const Color.fromRGBO(250, 202, 88, .3),
    300: const Color.fromRGBO(250, 202, 88, .4),
    400: const Color.fromRGBO(250, 202, 88, .5),
    500: const Color.fromRGBO(250, 202, 88, .6),
    600: const Color.fromRGBO(250, 202, 88, .7),
    700: const Color.fromRGBO(250, 202, 88, .8),
    800: const Color.fromRGBO(250, 202, 88, .9),
    900: const Color.fromRGBO(250, 202, 88, 1),
  };

  List<PageItem> arrItems = [
    PageItem(imgPath: 'assets/image/firstscreen.jpg'),
    PageItem(imgPath: 'assets/image/second.jpg'),
    PageItem(imgPath: 'assets/image/three.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final MaterialColor colorCustom = MaterialColor(0xFFD12C4A, color);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: StartupScreenNavigationProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StartUpScreen(
          arrPageItems: arrItems,
          pageIndicatorColor: Colors.grey,
          pageIndicatorSelectedColor: Color(0xFFC66E7B),
          buttonsColor: Color(0xFFB1132B),
          buttonsTextColor: Colors.white,
          skipScreenCallback: (BuildContext context) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LandingPage()));
          },
          nextPageCallback: (BuildContext context, int page) {
            if (page == arrItems.length - 1) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LandingPage()));
            }
          },
        ),
      ),
    );
  }
}