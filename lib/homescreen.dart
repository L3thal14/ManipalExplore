import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moneypal/creator.dart';
import 'package:moneypal/discover.dart';
import 'package:moneypal/weatherpage.dart';
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
      bool isEnableTile = false;
   
      _HomeScreenState();
  AnimationController animationController;
  Widget tabBody = Container(
    color: Colors.white,
  );
  int _page = 0;
  final _pageOption = [
        Weatherpage(),
        Placespage(),
        Creatorpage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
         bottomNavigationBar: CurvedNavigationBar( 
    color: Colors.white,
    backgroundColor: Colors.teal, 
    buttonBackgroundColor: Colors.tealAccent,
    height: 50,
    items: <Widget>[
      Icon(MdiIcons.weatherPouring, size: 20),
      Icon(Icons.directions_car, size: 20),
      Icon(Icons.person, size: 20),
    ],
    animationDuration: Duration(
      milliseconds: 300,
    ),
    animationCurve: Curves.bounceInOut,
    onTap: (index) {
      setState(() {
        _page = index;
      });
      
    },
  ),
  
        body: _pageOption[_page],
      
            )
    );


     
  }

  
}