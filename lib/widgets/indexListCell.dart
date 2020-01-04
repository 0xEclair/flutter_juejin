import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_juejin/widgets/goodAndCommentCell.dart';
import 'package:flutter_juejin/widgets/inTextDot.dart';
import '../model/indexCell.dart';
import '../routers/application.dart';

class IndexListCell extends StatelessWidget{
  final IndexCell cellInfo_;

  IndexListCell({Key key,this.cellInfo_}):super(key:key);

  TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/detail?id=${Uri.encodeComponent(cellInfo_.detailUrl)}&title=${Uri.encodeComponent(cellInfo_.title)}");
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildFirstRow(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9.0),
              child: Text(
                cellInfo_.title,
                style: TextStyle(
                    color: Color(0xFF393C3F),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GoodAndCommentCell(cellInfo_.collectionCount,cellInfo_.commentCount),
            SizedBox(height: 15.0),
            Divider(height: 12.0)
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFirstRow(){
    List<Widget> listRow = new List();
    if(cellInfo_.hot){
      listRow.add(
        Text("热",
            style:TextStyle(
                color: Color(0xFFF53040),
                fontWeight: FontWeight.w600))
      );
    }

    if(cellInfo_.isCollection == "post") {
      if(cellInfo_.hot){
        listRow.add(InTextDot());
      }
      listRow.add(
          Text("专栏",
              style: TextStyle(
                color: Color(0xFFBC30DA),
                fontWeight: FontWeight.w600
              )));
      listRow.add(InTextDot());
    }
    listRow.add(Text(cellInfo_.username,style:titleTextStyle));
    listRow.add(InTextDot());
    listRow.add(Text(cellInfo_.createdTime,style:titleTextStyle));
    listRow.add(InTextDot());
    listRow.add(Expanded(
      // 防止文本超长
      child: Text(
        cellInfo_.tag,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    ));
    return listRow;
  }
}