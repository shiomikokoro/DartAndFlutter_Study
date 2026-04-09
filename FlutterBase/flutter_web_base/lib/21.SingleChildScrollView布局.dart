import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ScrollController _scrollController = ScrollController();

  //示图
  List<Widget> getList(){
    return List.generate(50,(index)=>Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      height: 100,
      width:double.infinity,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("我是第${index+1}个",style: TextStyle(color: Colors.white,fontSize: 30)),
      
    ));
  }

  //按钮
  Positioned getButton(String buttonText,{VoidCallback? onPressed,double? top,double? bottom,double? right,double? left}){
    return Positioned(
      right:right, top: top, left: left, bottom: bottom,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
        color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextButton(
          onPressed: onPressed, 
          //依赖父类有明确尺寸的情况，否可可以用SizeBox.expend()包裹
          style: TextButton.styleFrom(minimumSize: Size(double.infinity, double.infinity)),
          child: Text(buttonText,style:TextStyle(color: Colors.white))
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SingleChildScrollView示例")),
        body: Stack(
          children: [
            //SingleChildScrollView 单子组件滚动布局
            //只能有一个子组件，但可以包裹Column或row组件中嵌套多个子组件
            //可以设置scrollDirection属性控制滚动方向，默认时垂直方向(Axis.vertical)，也可设置为水平方向(Axis.horizontal)
            //是一次性加载全部子组件，所以仅适用于少量子组件，大量的建议使用ListView
            //可以通过调用controller.animateTo/jumpTo()来控制滚动
            ////可写入具体数值，或使用属性controller.position.maxScrollExtent等
            SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                spacing: 10,
                children: getList(),
              )
            ),
            //无动画跳转
            //_scrollController.jumpTo(_scrollController.position.maxScrollExtent)
            //有动画跳转
            //_scrollController.animateTo(
            //  _scrollController.position.maxScrollExtent,//跳转位置 
            //  duration: Duration(seconds: 1), //跳转速度
            //  curve: Curves.easeIn)//动画曲线
            getButton("去底部", onPressed:()=>_scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn),bottom: 0,right: 0),
            getButton("去顶部", onPressed:()=>_scrollController.animateTo(_scrollController.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn),top: 0,right: 0),
          ],
        )
      ),
    );
  }
}
