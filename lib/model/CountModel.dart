import 'package:flutter/foundation.dart';

class CountModel with ChangeNotifier {
  // 全局状态
  int count;
  // 初始构造函数
  CountModel(this.count);
  // 状态指定方法
  add() {
    this.count++;
    print(this.count);
    // 通知所有ui刷新
    notifyListeners();
  }
}
