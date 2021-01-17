import 'package:FlutterProvider/model/CountModel.dart';
import 'package:FlutterProvider/model/FristModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FristPage extends StatelessWidget {
  const FristPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Frist"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("当前名字：${Provider.of<FristModel>(context).name}"),
            ),
            Center(
              child: Text(
                  "首页的值为:${Provider.of<CountModel>(context).count.toString()}"),
            ),
          ],
        ),
      ),
    );
  }
}
