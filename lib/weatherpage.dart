/*
Author: Karthik R
Github : https://github.com/L3thal14
Application Name: Explore Manipal UI App
API Used: https://triptocarbon.com/documentation
*/
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
import "dart:math";

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Weatherpage(),
    ));

class Weatherpage extends StatefulWidget {
  @override
  WeatherpageState createState() => new WeatherpageState();
}

class WeatherpageState extends State<Weatherpage> {
  final String url = "http://api.openweathermap.org/data/2.5/weather";
  var list = ['Do not forget to carry your umbrella','Be sure to leave early because its going to get hot','Wear protective gear to safeguard eyes'];
  var dataset;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: <String, String>{
      'q': 'Manipal',
      'units': 'metric',
      'appid': '' // API Key to be inserted here
    });
    print(uri);
    var response = await http.get(uri, headers: {"Accept": "application/json"});

    setState(() {
      var toJsonData = json.decode(response.body);
      dataset = toJsonData;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    if (dataset == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return new Scaffold(
          backgroundColor: Colors.white,
          appBar: new AppBar(
            backgroundColor: Colors.teal,
            elevation: 0,
            title: new Text(
              "WEATHER",
              style: TextStyle(color: Colors.black, fontFamily: 'Georgia',fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Container(
              child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  constraints: new BoxConstraints.expand(
                    height: 280.0,
                  ),
                  padding:
                      new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage('assets/images/auto.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: new Stack(
                    children: <Widget>[
                      new Positioned(
                        left: 125.0,
                        bottom: 230.0,
                        child: new Transform.rotate(
                          angle: math.pi / 70,
                          child: Text(
                            'Weather Forecast',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Georgia',
                                color: Colors.white),
                          ),
                        ),
                      ),
                      new Positioned(
                          left: 35.0,
                          bottom: 210.0,
                          child: new Transform.rotate(
                            angle: math.pi / 40,
                            child: Text(
                              dataset['weather'][0]['main'].toString(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Georgia',
                                  color: Colors.white),
                            ),
                          )),
                      new Positioned(
                        left: 25.0,
                        bottom: 140.0,
                        child: new Image.asset(
                          'assets/images/animatedrain.gif',
                          height: 50,
                        ),
                      ),
                      new Positioned(
                        left: 40.0,
                        bottom: 95.0,
                        child: new Transform.rotate(
                          angle: math.pi / 40,
                          child: Text(
                            dataset['main']['temp'].toString() + '°C',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Georgia',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                  ),
                  SizedBox(height: 50,),
                  Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 24),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 68, bottom: 12, right: 16, top: 12),
                                    
                                child: 
                                Text(                              
                                  list[Random().nextInt(list.length)],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -12,
                        left: 0,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset('assets/images/tipsicon.jpg'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ],
          )
          )
          );
    }
  }
}
