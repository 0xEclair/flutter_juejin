import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_juejin/pages/articleDetail.dart';
import 'package:flutter_juejin/pages/pageForWeb.dart';
import 'package:flutter_juejin/pages/swipPage.dart';

Handler articleDetailHandler=Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String articleId=params["id"]?.first;
    String title=params["title"]?.first;
    print("index>,articleDetail id is $articleId");
    return ArticleDetail(articleId,title);
  }
);

Handler webPageHandler=Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>>params){
    String articleUrl=params["url"]?.first;
    String title=params["title"]?.first;
    print("$articleUrl and $title");
    return PageForWeb(articleUrl,title);
  }
);

Handler swipPageHandler=Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String pics=params["pics"]?.first;
    String index=params["currentIndex"]?.first;
    print(pics);
    return SwipPage(pics:pics,currentIndex:index);
  }
);