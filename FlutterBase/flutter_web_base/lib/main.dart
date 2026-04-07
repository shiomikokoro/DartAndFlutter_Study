import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() {
    print("createState exccute");
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  //一般在这个阶段获取数据
  @override
  void initState() {
    print("initState exccute");
    super.initState();
  }
  //initState()之后立刻执行，当所依赖的 InheritedWidget 全局状态更新时调用，可能多次
  @override
  void didChangeDependencies() {
    print("didChangeDependencies exccute");
    super.didChangeDependencies();
  }
  //初始化、更新后多次调用
  @override
  Widget build(BuildContext context) {
    print("build exccute");
    return const Placeholder();
  }
  //传入新配置时调用，用于比对旧配置
  @override
  void didUpdateWidget(covariant MyWidget oldWidget) {
    print("didUpdateWidget exccute");
    super.didUpdateWidget(oldWidget);
  }
  //当State对象从树中暂时移除时调用
  @override
  void deactivate() {
    print("deactivate exccute");
    super.deactivate();
  }
  //State对象永久移除时调用，释放资源，仅执行一次。
  @override
  void dispose() {
    print("dispose exccute");
    super.dispose();
  }
}

