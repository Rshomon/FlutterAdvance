import 'package:FlutterProvider/model/CountModel.dart';
import 'package:FlutterProvider/model/FristModel.dart';
import 'package:FlutterProvider/pages/Fluro.dart';
import 'package:FlutterProvider/routes/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/Frist.dart';
import './pages/FutureBuilder.dart';
import './pages/StreamBuilder.dart';
import "./routes/routes.dart";

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CountModel>(create: (_) => CountModel(0)),
      ChangeNotifierProvider<FristModel>(create: (_) => FristModel("Rm")),
    ],
    child: MyApp(),
  ));
}
// main() {
//   runApp(
//     // 使用Provider管理
//     ChangeNotifierProvider<FristModel>(
//       create: (BuildContext context) {
//         return FristModel("Rm");
//       },
//       child: ChangeNotifierProvider<CountModel>(
//         create: (_) {
//           return CountModel(0);
//         },
//         child: MyApp(),
//       ),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage() {
    // 注册路由
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    // 获取Provider管理的model
    CountModel count = Provider.of<CountModel>(context);
    FristModel fristmodel = Provider.of<FristModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Provider"),
      ),
      body: Center(
        // 使用Consumer刷新ui
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountModel>(
              builder: (BuildContext context, value, Widget child) {
                return Text("当前的值：${count.count.toString()}");
              },
            ),
            RaisedButton(
                child: Text("跳转"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FristPage();
                  }));
                }),
            RaisedButton(
                child: Consumer<FristModel>(
                  builder: (context, value, child) => Text(value.name),
                ),
                onPressed: () {
                  fristmodel.ChangeName("Sanc");
                }),
            RaisedButton(
                child: Text("Future"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FutureBuilderPage();
                    }),
                  );
                }),
            RaisedButton(
                child: Text("Stream"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return StreamBuilderPage();
                    }),
                  );
                }),
            RaisedButton(
                child: Text("Fluro"),
                onPressed: () {
                  Application.router.navigateTo(context, "/fluro/Rm");
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 调用model中的方法，会在control中输出，但是不会在ui上更新
          count.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
