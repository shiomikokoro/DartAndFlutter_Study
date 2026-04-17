import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key,required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {

  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: Stack(
        children: [
          _getSlider(),
          _getSearch(),
          _getDot(),
        ],
      ) 
    );
  }

  Widget _getSlider(){
  //获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller, 
      items: List.generate(widget.bannerList.length, (index){
        return Image.network(
          widget.bannerList[index].imgUrl, 
          width: screenWidth, 
          fit:BoxFit.cover
        );
    }), options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      height: 300,
      onPageChanged: (index, reason) {
        _currentIndex = index;
        setState(() {});
      },)
    );
  }

    Widget _getDot(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 5,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index){
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(index,duration: Duration(milliseconds: 300));
              },
              //当自身数据发生变化时产生动画
              child: AnimatedContainer(
                height: 6,
                width: index==_currentIndex?40:20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: index==_currentIndex?Colors.white:Color.fromRGBO(0,0,0,0.3),
                  borderRadius: BorderRadius.circular(3)
                ),
              )
            ) ;
          }),
        ),
      )
    );
  }

  Widget _getSearch(){
    return Positioned(
      top:5,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0,0,0,0.4),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text("搜索",style: TextStyle(color: Colors.white,fontSize: 16),),
        ),
      )
    );
  }
}