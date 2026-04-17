import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendResult recommendResult;
  const HmSuggestion({super.key, required this.recommendResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  List<GoodsItem> _getDisplayItems(){
    if(widget.recommendResult.subTypes.isEmpty) return [];
    return widget.recommendResult.subTypes.first.goodsItems.items.take(3).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,height: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage("lib/assets/home_cmd_sm.png"),fit: BoxFit.cover),
      ),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        spacing: 5,
        children: [
          _buildHeader(),
          Row(
            spacing: 5,
            children: [
              Expanded(flex: 1,child: _buildLeft(),),
              Expanded(
                flex: 3,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildList(),
              ))
            ],
          ),
        ],
      )
    );
  }
  Widget _buildHeader(){
    return Row(
      spacing: 10,
      children: [
        Text("特惠推荐",style: TextStyle(color: const Color.fromARGB(255, 86, 24, 20),fontSize: 18,fontWeight: FontWeight.w700),),
        Text("精选省攻略"),
      ],
    );
  }
  Widget _buildLeft(){
    return SizedBox(
      width: 100,height: 145,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.asset("lib/assets/home_cmd_inner.png",fit: BoxFit.cover),
      ),
    );
  }
  List<Widget> _buildList(){
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (index){
      return Column(
        spacing: 5,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              list[index].picture,
              errorBuilder:(context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  width: 100,height: 120,
                  fit: BoxFit.cover
                );
              },
              width: 100,height: 120,
              fit: BoxFit.cover,)
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 96, 12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("￥${list[index].price}",style: TextStyle(color: Colors.white),),
          )
        ],
      );
    });
  }
}