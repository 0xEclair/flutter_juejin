import 'package:flutter_juejin/util/netUtils.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

import '../model/indexCell.dart';
import '../api/api.dart';

class DataUtils{
  static Future<String> _loadIndexListAsset() async{
    return await rootBundle.loadString("assets/indexListData.json");
  }

  static Future<List<IndexCell>> getIndexListData(Map<String,dynamic> params) async {
    var response=await NetUtils.get(Api.RANK_LIST,params: params);
    var responseList=response["d"]["entrylist"];
    List<IndexCell> resultList=new List();
    for(int i=0;i<responseList.length;i++){
      try {
        IndexCell cellData=new IndexCell.fromJson(responseList[i]);
        resultList.add(cellData);
      }
      catch (e) {
        // no specified type,handles all
        print("something really unknown: $i");
      }
    }
    return resultList;
  }
}