import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmMoreList extends StatefulWidget {
  final List<GoodDetailItem> recommendList;

  const HmMoreList({super.key, required this.recommendList});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 0.75,//宽高比，默认1，就是长方形
        // mainAxisExtent: 500,//也可以用这个设置主轴长度，优先级高于childAspectRatio
      ),
      itemCount: widget.recommendList.length,
      // itemBuilder: (BuildContext context, int index) =>Container(
      //   height: 200,
      //   margin: EdgeInsets.only(left: (index+1)%2==1?10:0,right: (index+1)%2==0?10:0),
      //   color: Colors.blue,
      //   alignment: Alignment.center,
      //   child: Text("视频${index+1}",style: TextStyle(color: Colors.white,fontSize: 20)),
        
      // ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: (index+1)%2==1?10:5,right: (index+1)%2==0?10:5),
        child: _getChildren(index),
      ),
    );
  }
  Widget _getChildren(int index){
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                widget.recommendList[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "￥${widget.recommendList[index].price}",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(text: (double.parse(widget.recommendList[index].price)+20).toString(),style: TextStyle(color: Colors.grey,fontSize: 12)),
                    ]
                  )
                ),
                Text(
                  "${widget.recommendList[index].payCount}人付款",
                  style: const TextStyle(color: Colors.grey),
                ),
              ]
            ),
          )
        ]
      ),
    );
  }
}