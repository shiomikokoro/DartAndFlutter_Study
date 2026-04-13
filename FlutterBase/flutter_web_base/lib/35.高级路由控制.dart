import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {
        "/goodsList":(context) => GoodsList(),
      },
      onGenerateRoute: (settings) {
        if(settings.name == "/CartList"){
          bool isLogin = true;
          if(isLogin){
            return MaterialPageRoute(builder: (context)=>CartList());
          }else{
            return MaterialPageRoute(builder: (context)=>LoginPage());
          }
        }
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context)=>Page404()),
    );
  }
}
class GoodsList extends StatefulWidget {
  const GoodsList({super.key});

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GoodsList"),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.pushNamed(context, "/CartList");
        }, child: Text("加入购物车")),
      ),
    );
  }
}
class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CartList"),
      ),
      body: Center(
        child: TextButton(onPressed: (){}, child: Text("去支付")),
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Center(
        child: TextButton(onPressed: (){}, child: Text("登陆")),
      ),
    );
  }
}

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404 Not Found"),
      ),
      body: Center(
        child: Text("404 Not Found"),
      ),
    );
  }
}
