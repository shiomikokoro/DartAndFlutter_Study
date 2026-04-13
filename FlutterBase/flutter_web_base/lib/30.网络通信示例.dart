import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_base/DioUtils.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String,dynamic>> _list = [];

  @override
  void initState() {
    super.initState();
    _getChannels();
  }

  void _getChannels() async{
    DioUtils utils = DioUtils();
    Response<dynamic> result = await utils.get("channels");
    //性能损耗
    //如果数据可读且逻辑清晰强转比jsonDecode性能更小
    //更多的卡顿在于UI的rebuild和json读取与转换
    Map<String,dynamic> res = result.data as Map<String,dynamic>;
    _list = (res["data"]["channels"] as List).cast<Map<String,dynamic>>();
    print(_list);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("频道管理"),),
        body:Container(
          margin: EdgeInsets.all(10),
          child:GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2
            ), 
            itemCount: _list.length,
            itemBuilder: (BuildContext buildContext,int index){
              return ChannelItem2(index:index,item:_list[index],delChannel: (index){
                _list.removeAt(index);
                setState(() {});
              },);
            }
          ),
        ) 
      ),
    );
  }
}
class ChannelItem extends StatelessWidget {
  final Map<String,dynamic> item;
  const ChannelItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(item['name'],style: TextStyle(color: Colors.white,fontSize: 20)),
    );
  }
}
class ChannelItem2 extends StatefulWidget {
  final int index;
  final Map<String,dynamic> item;
  final Function(int index) delChannel;
  const ChannelItem2({super.key,required this.index ,required this.item,required this.delChannel});

  @override
  State<ChannelItem2> createState() => _ChannelItem2State();
}

class _ChannelItem2State extends State<ChannelItem2> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(widget.item['name'],style: TextStyle(color: Colors.white,fontSize: 20)),
        ),
        Positioned(
          right: 1,top: 1,
          child: IconButton(
            color: Colors.red,
            onPressed: (){
              widget.delChannel(widget.index);
            }, icon: Icon(Icons.delete))
        )
      ],
    );
  }
}