import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanded示例"),
        ),
        body: Container(
          height: double.infinity,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(height: 100,color: Colors.blue),
              //未设置高度，但自动以最大空间为标准
              Expanded(child: Container(color: Colors.blueGrey)),
              Container(height: 100,color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}