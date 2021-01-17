import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import "../pages/Fluro.dart";

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String name = params['name'].first;
  return FluroPage(name: name);
});
