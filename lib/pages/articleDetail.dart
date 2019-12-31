import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetail extends StatefulWidget {
  final String articleUrl_;
  final String title_;

  ArticleDetail(this.articleUrl_, this.title_);
  ArticleDetailState createState() => ArticleDetailState();
}

class ArticleDetailState extends State<ArticleDetail> {
  bool hasLoad_=false;
  final flutterWebViewPlugin=new FlutterWebviewPlugin();

  @override
  void initState() {
    flutterWebViewPlugin.onStateChanged.listen((state){
      if(state.type==WebViewState.finishLoad){
        setState(() {
          hasLoad_=true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.articleUrl_,
      appBar: AppBar(
        title: Text(widget.title_),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true
    );
  }
}