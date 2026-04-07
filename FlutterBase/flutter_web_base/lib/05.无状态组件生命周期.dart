import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("无状态组件-构建");
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text("无状态组件"),
          ),
        ),
      ),
    );
  }
}

