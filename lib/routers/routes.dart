import 'routerHandler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root="/";
  static String articleDetail="/detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler=new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print("Route was not fount!");
        return null;
      });

    router.define(articleDetail, handler: articleDetailHandler);
  }
}