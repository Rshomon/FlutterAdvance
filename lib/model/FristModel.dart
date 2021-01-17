import 'package:flutter/cupertino.dart';

class FristModel with ChangeNotifier {
  String name;
  FristModel(this.name);

  // ignore: non_constant_identifier_names
  ChangeName(String newName) async {
    this.name = newName;
    print("当前名字为：${this.name}");
    notifyListeners();
  }
}
