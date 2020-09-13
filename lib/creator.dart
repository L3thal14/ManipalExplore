import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class Creatorpage extends StatefulWidget {
  @override
  CreatorpageState createState() => new CreatorpageState();
}

class CreatorpageState extends State<Creatorpage> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: AppBar(
        title: Text('CREATOR',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Georgia',
                fontWeight: FontWeight.bold)),
//        backgroundColor: Colors.transparent,
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal, //                   <--- border color
                      width: 5.0,
                    ),
                    color: Colors.teal,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://avatars0.githubusercontent.com/u/14162311?v=4'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.teal)
                    ])),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 15,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            color: Colors.teal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 40,
                ),
                Expanded(
                  child: Center(
                      child: Text(
                    'Karthik R',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Georgia'),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: _github,
                color: Colors.teal,
                textColor: Colors.black,
                child: Icon(
                  MdiIcons.github,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              MaterialButton(
                onPressed: _twitter,
                color: Colors.teal,
                textColor: Colors.black,
                child: Icon(
                  MdiIcons.twitter,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              MaterialButton(
                onPressed: _linkedin,
                color: Colors.teal,
                textColor: Colors.black,
                child: Icon(
                  MdiIcons.linkedin,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_github() async {
  final String url = "https://github.com/L3thal14";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_linkedin() async {
  final String url = "https://www.linkedin.com/in/karthikr1406/";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_twitter() async {
  final String url = "https://twitter.com/karthik_geek14";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
