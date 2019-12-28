import 'package:flutter/material.dart';
import 'package:flutter_juejin/widgets/goodAndCommentCell.dart';
import 'package:flutter_juejin/widgets/inTextDot.dart';
import '../model/indexCell.dart';

class IndexListCell extends StatelessWidget{
  final IndexCell cellInfo;

  IndexListCell({Key key,this.cellInfo}):super(key:key);

  TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0
  );



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: buildFirstRow(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 9.0),
            child: Text(
              cellInfo.title,
              style: TextStyle(
                color: Color(0xFF393C3F),
                fontSize: 14.0,
                fontWeight: FontWeight.w600
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GoodAndCommentCell(cellInfo.collectionCount,cellInfo.commentCount),
          SizedBox(height: 15.0),
          Divider(height: 12.0)
        ],
      ),
    );
  }

  List<Widget> buildFirstRow(){
    List<Widget> listRow = new List();
    if(cellInfo.hot){
      listRow.add(
        Text("热",
            style:TextStyle(
                color: Color(0xFFF53040),
                fontWeight: FontWeight.w600))
      );
    }
    if(cellInfo.isCollection == "post") {
      listRow.add(
          Text("专栏",
              style: TextStyle(
                color: Color(0xFFBC30DA),
                fontWeight: FontWeight.w600
              )));
      listRow.add(InTextDot());
    }
    listRow.add(Text(cellInfo.username,style:titleTextStyle));
    listRow.add(InTextDot());
    listRow.add(Text(cellInfo.createdTime,style:titleTextStyle));
    listRow.add(InTextDot());
    listRow.add(Expanded(
      // 防止文本超长
      child: Text(
        cellInfo.tag,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    ));
    return listRow;
  }
}