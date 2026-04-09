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
          title: Text("Text示例"),
        ),
        body: Container(
          height: 500,
          width: double.infinity,
          color: Colors.amber,
          //Text 文本组件
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!Hello,Flutter!",
                maxLines: 2,//行数限制
                overflow: TextOverflow.ellipsis,//超出最大行显示
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,//文本颜色
                  fontStyle: FontStyle.italic,//文本类型
                  fontWeight: FontWeight.w900,//文本粗细
                  decoration: TextDecoration.underline,//文本装饰
                  decorationColor: Colors.red,//装饰颜色
                ),
              ),
              //如果想要实现富文本效果，可以用Text.rich()配合TextSpan使用
              Text.rich(TextSpan(
                text: "Hello", 
                //第一个
                style: TextStyle(color: Colors.red,fontSize: 40,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.amber),
                //依次接续,如果TextStyle不写样式，则会直接继承父类的Style
                children: [
                  TextSpan(text: " Flutter",style: TextStyle(color: Colors.green,fontWeight: FontWeight.normal)),
                  TextSpan(text: "!"),
                ],
              ))
            ],
          )
          
        ),
      ),
    );
  }
}