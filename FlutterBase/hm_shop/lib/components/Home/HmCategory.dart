import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  const HmCategory({super.key,required this.categoryList});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child:  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index){
          final category = widget.categoryList[index];
          return Container(
            width: 100,
            margin: EdgeInsets.only(left: 10,right: index!=5?0:10,top: 10,bottom: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture,width: 50,height: 50,),
                Text(category.name,style: TextStyle(fontSize: 14,color: Colors.black),)
              ],
            ),
          );
        },
      ),
    );
  }
}
