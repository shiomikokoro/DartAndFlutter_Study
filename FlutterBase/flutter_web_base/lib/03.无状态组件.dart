import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "无状态组件",
      home: Scaffold(
        //topbar
        appBar: AppBar(
          title: Text("top bar/appbar"),
        ),
        //content
        body: Container(
          child: Center(
            child: Text("content/body"),
          ),
        ),
        //footer
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Center(
            child: Text("footer/bottomNavigationBar"),
          ),
        ),
      ),
    );
  }
  
}
