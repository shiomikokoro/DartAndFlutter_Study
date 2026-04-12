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
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("PageView示例")),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,height: 200,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    //默认构造方式
                    //PageView.builder() 懒加载
                    ////也可设置PageController属性进行控制跳转，也有直接跳转和动画跳转的方法。
                    child: PageView.builder(
                      itemCount: 6,
                      controller: _pageController,
                      itemBuilder: (BuildContext BuildContext,int index){
                        return Container(
                          height: 100,
                          alignment: Alignment.center,
                          child: Image.network(
                            "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/${index+1}.jpg",
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          // child: Text("轮播图${index+1}",style: TextStyle(color: Colors.white),),
                        );
                      },
                    ),
                  ),
                  //控制跳转的小按钮
                  Positioned(
                    bottom: 0,
                    right: 0,left: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index){
                          return GestureDetector(
                            onTap: () {
                              // _pageController.jumpToPage(index);
                              _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                _currentIndex = index;
                              setState(() {});
                            },
                            child:Container(
                              width: 15,
                              height: 15,
                              margin: EdgeInsets.only(left: index!=0?15:0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index==_currentIndex?Colors.red:Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.red.withAlpha(50),blurRadius: 1,spreadRadius: 3,offset: Offset(1, 1))
                                ],
                              ),
                            )
                          );
                        }),
                      ),
                    )
                  )
                ],
              ) 
              
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
