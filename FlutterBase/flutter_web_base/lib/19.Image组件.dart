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
          title: Text("Image示例"),
        ),
        body: Container(
          height: 500,
          width: double.infinity,
          color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image 图片组件
              //Image.asset()     加载项目目录资源，需要在配置文件中声明
              //Image.network()   加载网络资源，安卓、IOS、鸿蒙需要配置网络权限
              //Image.file()      加载本地图片
              //Image.memory()    加在内存中的图片数据
              //需要在pubspec.yaml配置图片路径所在位置
              Image.asset(
                "assets/images/Icon-512.png",
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              //在安卓/IOS/鸿蒙中使用网络图片需要配置网络权限
              Image.network(
                "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
              )
            ],
          )
          
        ),
      ),
    );
  }
}