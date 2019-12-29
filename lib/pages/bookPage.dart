import 'package:flutter/material.dart';

class BookPage extends StatefulWidget{
  BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage>{
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: TabBar(
              tabs: <Widget>[
                Tab(child: Column(children: <Widget>[
                  Icon(Icons.directions_car),
                  Text("car")
                ])),
                Tab(child: Column(children: <Widget>[
                  Icon(Icons.directions_transit),
                  Text("transit")
                ])),
                Tab(child: Column(children: <Widget>[
                  Icon(Icons.directions_bike),
                  Text("bike")
                ]))
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike)
            ],
          ),
        ));
  }
}