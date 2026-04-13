import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/list",
      routes: {
        "/list":(context)=>ListWidget(),
        "/detail":(context)=>DetailWidget(),
      },
      home: ListWidget(),
    );
  }
}
class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listView"),
      ),
      body: ListView.builder(
        itemCount: 100,
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext buildContext,int index){
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/detail");
            },
            child: Container(
              height: 60,
              color: Colors.blue,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text("模块${index+1}",style: TextStyle(color: Colors.white,fontSize: 20)),
            )
          );
        }
      ),
    );
  }
}
class DetailWidget extends StatefulWidget {
  const DetailWidget({super.key});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: (){
              Navigator.pushNamed(context,"/list");
            }, child: Text("前往列表页")),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("返回上一页")),
          ],
        )
      ),
    );
  }
}