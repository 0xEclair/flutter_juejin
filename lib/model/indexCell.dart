import '../util/util.dart';

class IndexCell{
  bool hot;
  String isCollection;
  String tag;
  String username;
  int collectionCount;
  int commentCount;
  String title;
  String createdTime;
  String detailUrl;

  IndexCell({
    this.hot,this.tag,this.username,this.collectionCount,
    this.createdTime,this.commentCount,this.title,
    this.detailUrl,this.isCollection});

  factory IndexCell.fromJson(Map<String,dynamic> json){
    String tag_="";
    if(json["tags"].length>0){
      tag_="${json["tags"][0]["title"]}/";
    }
    return IndexCell(
      hot: json["hot"],
      collectionCount: json["collectionCount"],
      commentCount: json["commentsCount"],
      tag: "$tag_${json["category"]["name"]}",
      username: json["user"]["username"],
      createdTime: Util.getTimeDuration(json["createdAt"]),
      title: json["title"],
      detailUrl: json["originalUrl"],
      isCollection: json["type"]
    );
  }
}