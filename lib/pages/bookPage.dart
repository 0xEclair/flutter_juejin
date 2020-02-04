import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/bookNav.dart';
import 'package:flutter_juejin/pages/bookPageTabView.dart';
import 'package:flutter_juejin/util/dataUtils.dart';

class BookPage extends StatefulWidget{
  BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    getNavList();
  }

  @override
  Widget build(BuildContext context) {
    if(_navData.length==0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:TabBar(controller: _tabController,tabs: _myTabs,indicatorColor: Colors.white,isScrollable: true,)
      ),
      body: TabBarView(
        controller: _tabController,
        children: _myTabView,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  getNavList(){
    DataUtils.getBookNavData().then((resultData){
      resultData.forEach((BookNav bn){
        _myTabs.add(Tab(text: bn.name,));
        _myTabView.add(BookPageTabView(
          alias: bn.alias,
        ));
      });
      if(this.mounted){
        setState(() {
          _navData=resultData;
        });
        _tabController= new TabController(vsync: this,length: _navData.length+1);
      }
    });
  }

  List<BookNav> _navData=new List();
  List<Tab> _myTabs=<Tab>[
    Tab(text: "全部",)
  ];
  List<BookPageTabView> _myTabView=<BookPageTabView>[
    BookPageTabView(alias: "all",)
  ];

  TabController _tabController;
}