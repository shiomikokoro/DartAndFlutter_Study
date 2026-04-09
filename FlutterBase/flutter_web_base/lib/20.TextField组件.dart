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
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextField setTextField(TextEditingController controller, String hintText) {
    //TextField 文本框组件
    //必须得是有状态组件中的一部分
    //常用属性
    ////controller    文本框控制器，获取文本内容以及监听变化的
    ////decortation   文本框样式
    ////style         文字样式
    ////maxLine       最大行数
    ////onChanged     文本框内容发生变化后的回调函数
    ////onSubmitted   文本框内容被提交后的回调函数
    return TextField(
      controller: controller,//编辑器控制器，获取文本内容以及监听变化的。
      obscureText: hintText.endsWith("password")?true:false,//是否隐藏内容
      // onChanged: (value) => print(value),//当文本框内容发生变化时触发
      onSubmitted: (value) => print(value),//当文本框内容提交（回车）时触发
      decoration: InputDecoration(//定制样式
        hintText: hintText,//提示文本
        contentPadding: EdgeInsets.only(left: 20),
        fillColor: const Color.fromARGB(255, 195, 194, 159),//文本框背景色
        filled: true,//是否应用文本框背景色
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TextField登录示例")),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 25,
            children: [
              //样式几乎相同的TextField生成函数
              setTextField(_accountController, "input your account"),
              setTextField(_passwordController, "input your password"),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: ()=>print("登录账户是${_accountController.text}+${_passwordController.text}"),
                  child: Text("登录", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
