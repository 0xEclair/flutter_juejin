import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  final bool hasMore_;

  LoadMore(this.hasMore_);

  @override
  Widget build(BuildContext context) {
    if(hasMore_){
      return Container(
        height: 70.0,
        child: Center(
          child: Opacity(
            opacity: 1.0,
            child: CircularProgressIndicator(
              strokeWidth: 10.0
            ),
          ),
        ),
      );
    }
    return Container(
      height: 70.0,
      child: Center(
        child: Text(
          "底线",
          style: TextStyle(color: Theme.of(context).accentColor))
      )
    );
  }
}