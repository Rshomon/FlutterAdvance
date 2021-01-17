import 'package:FlutterProvider/routes/route_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static String root = "/fluro/:name";
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root,
        handler: rootHandler, transitionType: TransitionType.fadeIn);
  }
}
