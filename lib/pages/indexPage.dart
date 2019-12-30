import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';
import 'package:flutter_juejin/widgets/indexListHeader.dart';
import 'package:flutter_juejin/widgets/loadMore.dart';
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
    scrollController_.addListener(() {
      if (scrollController_.position.pixels ==
          scrollController_.position.maxScrollExtent) {
        print('loadMore');
        getList(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(listData_.length);
    if(listData_.length==0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: listData_.length+2 , // 1 是header 2 是 loadMore
        itemBuilder: (context,index) => renderList(context, index),
        controller: scrollController_,
      )
    );
  }

  getList(bool isLoadMore) {
    if (isRequesting_ || !hasMore_) return null;
    if (!isLoadMore) {
      // reload的时候重置page
      pageIndex_ = 0;
    }

    params_["before"] = pageIndexArray[pageIndex_];
    isRequesting_ = true;
    DataUtils.getIndexListData(params_).then((result) {
      pageIndex_ += 1;
      List<IndexCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(listData_);
      }
      resultList.addAll(result);
      setState(() {
        listData_ = resultList;
        hasMore_ = pageIndex_ < pageIndexArray.length;
        isRequesting_ = false;
      });
    });
  }

  renderList(context,index){
    if(index==0){
      return IndexListHeader(false);
    }
    if(index==listData_.length+1){
      return LoadMore(hasMore_);
    }
    return IndexListCell(cellInfo_: listData_[index-1]);
  }

  Future<void> onRefresh() async {
    listData_.clear();
    setState(() {
      listData_=listData_;
      hasMore_=true;
    });
    getList(false);
    return null;
  }

  @override
  void dispose() {
    scrollController_.dispose();
    super.dispose();
  }

  List<IndexCell> listData_=new List();
  ScrollController scrollController_=new ScrollController();
  int pageIndex_ = 0;
  Map<String,dynamic> params_ = {
    "src":"web",
    "category":"all",
    "limit":20
  };
  bool hasMore_=true;
  bool isRequesting_=false;
}