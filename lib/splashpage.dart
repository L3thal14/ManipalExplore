import 'package:flutter/material.dart';
import 'package:moneypal/homescreen.dart';
import 'dart:async';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  startSplashTimer() {
    var _duration = new Duration(seconds: 9);
    return new Timer(_duration, navigateToHome);
  }

  navigateToHome() {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => HomeScreen()
      )
    );
  }

  @override
  void initState() {
    startSplashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: deviceHeight * 0.225,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(
      color: Colors.teal, //                   <--- border color
      width: 5.0,
    ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/splash.png")
                )
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.2,
            ),
            Text(
              "Manipal Explore",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "A Travel App",
              style: TextStyle(
                color: Colors.black,
                height: 1,
                wordSpacing: 1.5,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}