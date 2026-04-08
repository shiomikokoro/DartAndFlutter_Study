import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int count = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              TextButton(
                //setState函数不一定要包裹函数操作
                //因为本身就是异步操作，只要执行函数就能更新数据
                onPressed: ()=>setState(()=>count-=1),
                child: Text("减")
              ),
              Text("$count"),
              TextButton(
                onPressed: ()=>setState(()=>count+=1),
                child: Text("加")
              ),
            ],
          ),
        ),
      ),
    );
  }
}