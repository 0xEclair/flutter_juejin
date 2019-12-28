import 'package:flutter/material.dart';
import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';
import 'package:flutter_juejin/widgets/indexListHeader.dart';
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
    print(_listData.length);
    if(_listData.length==0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: _listData.length+1 , // 1 是header
        itemBuilder: (context,index) => renderList(context, index));
  }

  getList(bool isLoadMore){
    DataUtils.getIndexListData().then((resultList) {
      setState(() {
        _listData=resultList;
        print("1");
      });
    });
  }

  renderList(context,index){
    if(index==0){
      return IndexListHeader(false);
    }
    return IndexListCell(cellInfo: _listData[index-1]);
  }

  List<IndexCell> _listData=new List();
}