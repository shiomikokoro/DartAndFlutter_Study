import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Scaffold组件",
    theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
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
      bottomNavigationBar: Container(
        height: 80,
        child: Center(
          child: Text("footer/bottomNavigationBar"),
        ),
      ),
    ),
  ));
}
