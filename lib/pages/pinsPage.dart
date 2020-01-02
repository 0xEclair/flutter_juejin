import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/pinsCell.dart';
import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/loadMore.dart';
import '../widgets/pinsListCell.dart';
class PinsPage extends StatefulWidget{
  PinsPageState createState() => PinsPageState();
}

class PinsPageState extends State<PinsPage>{

  @override
  void initState() {
    getPinsList(false);
    super.initState();
    scrollController_.addListener((){
      if(scrollController_.position.pixels == scrollController_.position.maxScrollExtent){
        print("loadMore");
        getPinsList(true);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(listData_.length>0){
      return Container(
        color: Color(0xFFF4F5F5),
        child: ListView.builder(
            itemCount: listData_.length+1,
            itemBuilder:itemBuilder,
            controller: scrollController_,),
      );
    }
    else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void getPinsList(bool isLoadMore){
    if(isRequesting_||!hasMore_) return ;
    if(before_!=""){
      params_["before"]=before_;
    }
    if(!isLoadMore){
      params_["before"]="";
    }

    isRequesting_=true;
    before_=DateTime.now().toString().replaceFirst(RegExp(r" "), "T")+"Z";
    DataUtils.getPinsListData(params_).then((result){
      List<PinsCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(listData_);
      }
      resultList.addAll(result);
      if(this.mounted){
        setState(() {
          listData_=resultList;
          hasMore_=result.length!=0;
          isRequesting_=false;
        });
      }
    });
  }

  Widget itemBuilder(context,index){
    if(index == listData_.length){
      return LoadMore(hasMore_);
    }
    return PinsListCell(pinsCell: listData_[index]);
  }


  @override
  void dispose(){
    scrollController_.dispose();
    super.dispose();
  }

  List<PinsCell> listData_ = new List();
  Map<String,dynamic> params_= {
    "src":"web",
    "uid":"",
    "limit":20,
    "device_id":"",
    "token":""
  };
  bool isRequesting_ = false;
  bool hasMore_ = true;
  String before_ = "";
  ScrollController scrollController_ = new ScrollController();
}