import 'package:flutter/material.dart';

class FluroPage extends StatelessWidget {
  // 定义路由传参
  String name;
  FluroPage({this.name = "1111", Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluro"),
      ),
      body: Container(
        child: Center(
          child: Text("路由传参：${this.name}"),
        ),
      ),
    );
  }
}
