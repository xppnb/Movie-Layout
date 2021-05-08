import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static push(BuildContext context, Widget page) {
    return Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
