import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moneypal/detailspage.dart';
import 'package:url_launcher/url_launcher.dart';
class Placespage extends StatefulWidget {
  @override
  _PlacespageState createState() => _PlacespageState();
}

class _PlacespageState extends State<Placespage> {
  @override
  void initState() {
    super.initState();
  }
  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text("EXPLORE",style: TextStyle(color: Colors.black,fontFamily: 'Georgia',fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Card(
                    elevation: 15,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.search,
                            color: Color(0xffca3e47),
                            size: 30,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: TextField(
                        onChanged: (value) {
                          setState((){
                             searchString = value; 
                          });

                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),

                      ),
                          ),
                        ),
                      ],
                    ),
                  ),
        Expanded(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return showData['places'][index]['name'].toLowerCase().contains(searchString.toLowerCase())? Container(
                    margin: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: InkWell(
                        onTap: () {
                          _launchUrl(showData['places'][index]['mapurl']);
                         
                        },
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch, // add this
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                  showData['places'][index]['imageurl'],
                                  // width: 300,
                                  height: 200,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              title: Text(
                                  showData['places'][index]['name'],style: TextStyle(fontSize: 20),),
                              subtitle: Text(
                                  '${showData['places'][index]['distance'].toString()}',style: TextStyle(fontSize: 14)),
                              trailing: RaisedButton(
                            elevation: 0.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            padding: EdgeInsets.only(
                                top: 7.0, bottom: 7.0, right: 30.0, left: 7.0),
                            onPressed: () {                           
                                      Navigator.push(
                                      context,
                                              MaterialPageRoute(builder: (context) => DetailsPage(name:showData['places'][index]['name'].toString(),
                                              imageurl: showData['places'][index]['imageurl'].toString(),
                                              dist: showData['places'][index]['distance'].toString(),
                                              desc: showData['places'][index]['description'].toString())),
                                        );
                                },
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Icon(Icons.info,size: 30,),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: new Text(
                                      "Know More",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Georgia'),
                                    ))
                              ],
                            ),
                            textColor: Colors.black,
                            color: Colors.teal),
                            )
                          ],
                        ),
                      ),
                    ),
                  ): Container();
                },
                itemCount:13,
              );
            }
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/places.json"),
        ),
      ),

      ],) 
      
      
    );
  }
}
 _launchUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}