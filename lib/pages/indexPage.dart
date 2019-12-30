import 'package:flutter/material.dart';

import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';
import 'package:flutter_juejin/widgets/indexListHeader.dart';
import '../model/indexCell.dart';
import '../constants/constants.dart';

const pageIndexArray = Constants.RANK_BEFORE;

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
    print(listData_.length);
    if(listData_.length==0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: listData_.length+1 , // 1 是header
        itemBuilder: (context,index) => renderList(context, index));
  }

  getList(bool isLoadMore){
    if(!isLoadMore) {
      pageIndex_=0;
    }
    params_["before"]=pageIndexArray[pageIndex_];

    DataUtils.getIndexListData(params_).then((result){
      setState(() {
        listData_=result;
      });
    });
  }

  renderList(context,index){
    if(index==0){
      return IndexListHeader(false);
    }
    return IndexListCell(cellInfo_: listData_[index-1]);
  }

  List<IndexCell> listData_=new List();
  int pageIndex_ = 0;
  Map<String,dynamic> params_ = {
    "src":"web",
    "category":"all",
    "limit":20
  };
}