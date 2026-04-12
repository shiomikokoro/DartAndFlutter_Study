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
  List<String> _data = ["鱼香肉丝","宫保鸡丁","麻婆豆腐","京酱肉丝","熘肉片"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(_data.length, (int index)=>SubPage(data: _data[index],index: index,delFood: (index) {
            _data.removeAt(index);
            setState(() {});
          },)),
        ),
      ),
    );
  }
}

class SubPage extends StatefulWidget {
  final String data;
  final int index;
  final Function(int index) delFood;
  const SubPage({super.key,required this.data,required this.index,required this.delFood});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(widget.data,style: TextStyle(color: Colors.white,fontSize: 20)),
        ),
        Positioned(
          right: 10,top: 10,
          child: IconButton(
            color: Colors.red,
            onPressed: (){
              widget.delFood(widget.index);
            }, icon: Icon(Icons.delete))
        )
      ],
    );
  }
}