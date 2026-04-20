import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/User.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/My/index.dart';
import 'package:hm_shop/stores/TokenManager.dart';
import 'package:hm_shop/stores/UserController.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final UserCntroller _userController = Get.put(UserCntroller());
  @override
  void initState() {
    super.initState();
    _initUser();
  }
  void _initUser() async{
    await tokenManager.init();//初始化token
    if(tokenManager.getToken().isNotEmpty){
      _userController.updateUser(await getUserAPI());
    }
  }

  //一般导航是固定的
  final List<Map<String,String>> _tabList = [
    {"text":"首页","icon":"lib/assets/ic_public_home_normal.png","active_icon":"lib/assets/ic_public_home_active.png"},
    {"text":"分类","icon":"lib/assets/ic_public_pro_normal.png","active_icon":"lib/assets/ic_public_pro_active.png"},
    {"text":"购物车","icon":"lib/assets/ic_public_cart_normal.png","active_icon":"lib/assets/ic_public_cart_active.png"},
    {"text":"我的","icon":"lib/assets/ic_public_my_normal.png","active_icon":"lib/assets/ic_public_my_active.png"}
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:IndexedStack(
          index: _currentIndex,
          alignment: Alignment.center,
          children: _getChildren(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          _currentIndex = index;
          setState(() {});
        },
        items: _getTabBarWidget(),
        type: BottomNavigationBarType.fixed,//显示文字并且评分宽度
        // showUnselectedLabels: true,//再未被选中时展示文字
        // selectedItemColor: Colors.black,//选中时的字体颜色
        // unselectedItemColor: Colors.black,//未被选中时的字体颜色
        currentIndex: _currentIndex,
      ),
    );
  }

  List<Widget> _getChildren(){
    return [
      HomeView(),
      CategoryView(),
      CartView(),
      MyView(),
    ];
  }

  List<BottomNavigationBarItem> _getTabBarWidget(){
    return List.generate(_tabList.length, (index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!,width: 30,height: 30,),
        activeIcon: Image.asset(_tabList[index]["active_icon"]!,width: 30,height: 30,),
        label: _tabList[index]["text"],
      );
    });
  }
}