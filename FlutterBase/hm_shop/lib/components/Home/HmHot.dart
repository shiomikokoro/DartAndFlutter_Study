// 首页爆款

import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmHot extends StatefulWidget {
  final List<GoodsItem> result;
  final String type;
  const HmHot({super.key, required this.result, required this.type});

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  List<GoodsItem> get _list {
    if(widget.result.isEmpty) return [];
    return widget.result.take(2).toList();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 215)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          spacing: 5,
          children: [
            _buildHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _getChildrenList(),
            ),
          ],
        ),
      );
  }
  
  List<Widget> _getChildrenList() {
    return List.generate(_list.length, (index){
      return Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                _list[index].picture,
                errorBuilder: (context, error, stackTrace) =>
                  Image.asset("lib/assets/home_cmd_inner.png",),
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _list[index].price.isEmpty ? _list[index].name : "￥${_list[index].price}",
              style: const TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 86, 24, 20),
              ),
            ),
          ],
        ));
    });
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站式买全" : "推荐爆款",
          style: const TextStyle(
            color: Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心优先" : "最受欢迎",
          style: const TextStyle(
            color: Color.fromARGB(255, 124, 63, 58),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

}
