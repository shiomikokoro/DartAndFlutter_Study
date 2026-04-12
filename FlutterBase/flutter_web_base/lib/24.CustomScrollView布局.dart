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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("CustomScrollView示例")),
        //CustomScrollView 复杂滚动布局方案
        //关键属性是Sliver，滚动示图的“切片”
        //Sliver常见属性或对应关系
        ////SLiverList    - ListView
        ////SliverGrid    - GridView
        ////SliverAppBar  - AppBar
        ////SliverPadding - Padding
        ////SliverToBoxAdapter - ToBoxAdapter
        ////SliverPersisentHeader 吸顶导航
        ////吸顶导航需要设置继承了SliverPersistentHeaderDelegate的类，且重写4个方法
        //////build构建子元素
        //////maxExtent设置最大展开高度（常规状态）
        //////minExtent设置最小折叠高度（吸顶状态）
        //////shouldRebuild是否在构筑
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Text("首页轮播图",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
            SliverPersistentHeader(delegate: _StickyCategory(),pinned: true),
            
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,//宽高比，默认1，就是长方形
                // mainAxisExtent: 500,//也可以用这个设置主轴长度，优先级高于childAspectRatio
              ),
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) =>Container(
                height: 200,
                margin: EdgeInsets.only(left: (index+1)%2==1?10:0,right: (index+1)%2==0?10:0),
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text("视频${index+1}",style: TextStyle(color: Colors.white,fontSize: 20)),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
class _StickyCategory extends SliverPersistentHeaderDelegate{

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) =>Container(
          width: 120,
          margin: EdgeInsets.only(left: 10,right: index!=5?0:10),
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("分类${index+1}",style: TextStyle(color: Colors.white,fontSize: 20)),
          
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70;//最大展开高度

  @override
  double get minExtent => 70;//最小折叠高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}

