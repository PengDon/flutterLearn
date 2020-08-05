import 'package:flutter/material.dart';
import 'package:flutter_learn/home.dart';
import 'package:flutter_learn/pages/button.dart';
import 'package:flutter_learn/pages/layout.dart';
import 'package:flutter_learn/pages/layout/wrap.dart';
import 'package:flutter_learn/pages/layout/flow.dart';

// 路由配置
final routes = {
  '/': (context) => HomePage(),
  '/button': (context, {arguments}) => ButtonPage(arguments: arguments),
  '/layout': (context, {arguments}) => LayoutPage(arguments: arguments),
  '/wrap': (context, {arguments}) => WrapPage(arguments: arguments),
  '/flow': (context, {arguments}) => FlowPage(arguments: arguments),
};

// 固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  print(settings.name);
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
