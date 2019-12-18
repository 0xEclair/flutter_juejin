import 'package:flutter/material.dart';
import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';
import '../model/indexCell.dart';

class IndexPage extends StatefulWidget{
  @override
  IndexPageState createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage>{

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("IndexPage"),
        IndexListCell(cellInfo: _listData.length>0?_listData[0]:IndexCell(username: "asd"))
      ],
    );
  }

  getList(bool isLoadMore){
    DataUtils.getIndexListData().then((resultList) {
      setState(() {
        _listData=resultList;
        print("1");
      });
    });
  }

  List<IndexCell> _listData=new List();
}