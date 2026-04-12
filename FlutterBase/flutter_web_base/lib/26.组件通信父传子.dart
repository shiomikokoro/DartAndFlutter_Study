import 'package:flutter/material.dart';

void main() {
  runApp(StatelessMessage());
}

class StatelessMessage extends StatelessWidget {
  const StatelessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child:Column(
            children: [
              Text("Stateless father element",style: TextStyle(color: Colors.blue,fontSize: 20)),
              Child(message: "shiomi"),
              Child2(message: "kokoro"),
            ],
          )
        ),
      ),
    );
  }
}
class Child2 extends StatelessWidget{
  final String? message;

  const Child2({super.key,this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Stateless child element - $message",style: TextStyle(color: Colors.red,fontSize: 16)),
    );
  }
  
}

class Child extends StatefulWidget {
  final String? message;
  const Child({super.key,required this.message});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    //widget就是该Child类的实例对象，可以通过该变量访问Child的属性和方法
    return Container(
      child: Text("Stateful child element - ${widget.message}",style: TextStyle(color: Colors.red,fontSize: 16)),
    );
  }
}