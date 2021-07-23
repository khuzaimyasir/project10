import 'package:flutter/material.dart';
import 'package:project_10/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class  ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);
  // make class "name" extends imp

  @override
  Widget build(BuildContext context) =>
      new Scaffold(
        appBar: new AppBar(
          title: new Text("help us grow and give feedback"),
        ),
        drawer:MyDrawer(),
         
        body: new Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Card(
            color: Colors.white70,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextButton.icon(
                icon: Icon(Icons.add_to_home_screen),
                label: Text(
                  "Open Website",
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () => launch("http://officialguidance.com"),
              )
              ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextButton.icon(
                      icon: Icon(Icons.call),
                      label:Text(
                          "03239900077", style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () => launch("j"),
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextButton.icon(
                      icon: Icon(Icons.email),
                      label:Text(
                          "contact instagram", style: TextStyle(fontSize: 25)),
                      onPressed: () =>
                          launch(
                              "https://instagram.com/laibaillustrates?utm_medium=copy_link"),
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child:  TextButton.icon(
                      icon: Icon(Icons.sms),
                      label:Text(
                          "Write a SMS", style: TextStyle(fontSize: 25)),
                      onPressed: () => launch("sms:03009400077"),
                     ),
                ),
              ],
            ),
          ),
          ],
          ),
          )
          )
      );
}
  

