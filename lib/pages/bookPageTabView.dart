

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/bookCell.dart';
import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/bookListCell.dart';

class BookPageTabView extends StatefulWidget{
  final String alias;
  BookPageTabView({Key,key,this.alias}):super(key:key);

  _BookPageTabViewState createState() => _BookPageTabViewState();
}

class _BookPageTabViewState extends State<BookPageTabView>{
  Map<String,dynamic> _params={
    "uid":"",
    "client_id":"",
    "token":"",
    "src":"web",
    "pageNum":1
  };
  List<BookCell> _bookList=<BookCell>[];

  getBookList(){
    if(widget.alias=="all"){
      _params["alias"]="";
    }
    else{
      _params["alias"]=widget.alias;
    }
    DataUtils.getBookListData(_params).then((resultList){
      if(this.mounted){
        setState(() {
          _bookList=resultList;
        });
      }
    });
  }

  Widget _itemBuilder(context,index){
    return BookListCell(cellData: _bookList[index]);
  }

  @override
  void initState() {
    super.initState();
    getBookList();
  }

  @override
  Widget build(BuildContext context) {
    if(_bookList.length==0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(itemBuilder: _itemBuilder,itemCount: _bookList.length);
  }
}