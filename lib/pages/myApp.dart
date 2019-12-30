import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './indexPage.dart';
import './pinsPage.dart';
import './bookPage.dart';
import './reposPage.dart';
import './activityPage.dart';
import '../routers/routes.dart';
import '../routers/application.dart';

class MyApp extends StatefulWidget{
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  MyAppState() {
    final router=new Router();
    Routes.configureRoutes(router);
    Application.router_=router;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color.fromRGBO(77, 145, 253, 1.0)),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Title"),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              IndexPage(),
              PinsPage(),
              BookPage(),
              ReposPage(),
              ActivityPage()
            ],
          ),
          bottomNavigationBar:Material(
            color: Theme.of(context).primaryColor,
            child:TabBar(
              tabs: _bottomTabs,
              controller: _tabController,
              indicatorColor: Colors.white,
            )
          )
        ),
        onGenerateRoute: Application.router_.generator,
      ),
    );
  }

  final TextStyle tabTextStyleNormal=TextStyle(color: const Color(0xffdddddd));
  final TextStyle tabTextStyleSelected=TextStyle(color: const Color(0xff4d91fd));
  TabController _tabController;

  final List<Tab> _bottomTabs=<Tab>[
    Tab(text: "首页",icon: Icon(Icons.home),),
    Tab(text: "沸点",icon: Icon(Icons.chat),),
    Tab(text: "小册",icon: Icon(Icons.book),),
    Tab(text: "开源库",icon: Icon(Icons.bubble_chart),),
    Tab(text: "活动",icon: Icon(Icons.local_activity),),
  ];

  var _body;
  List _appBarTitles=["首页","沸点","小册","开源库","活动"];

  @override
  void initState() {
    super.initState();
    _tabController=new TabController(length: _bottomTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}