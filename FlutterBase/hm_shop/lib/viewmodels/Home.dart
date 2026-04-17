class BannerItem{
  final String id;
  final String imgUrl;
  BannerItem({required this.id,required this.imgUrl});
  //扩展一个工厂函数，一般用factory来声明，用于创建实例对象
  //建议插件Freezed
  factory BannerItem.formJSON(Map<String,dynamic> json){
    return BannerItem(
      id: json["id"]??"",
      imgUrl: json["imgUrl"]??"",
    );
  }
}
class CategoryItem{
  final String id;
  final String name;
  final String picture;
  final List<CategoryItem>? children;
  CategoryItem({required this.id,required this.name,required this.picture,this.children});
  factory CategoryItem.formJSON(Map<String,dynamic> json){
    return CategoryItem(
      id: json["id"]??"",
      name: json["name"]??"",
      picture: json["picture"]??"",
      children: json["children"]==null?
        null:(json["children"] as List).map((item)=>CategoryItem.formJSON(item as Map<String,dynamic>)).toList(),
    );
  }
}

class GoodsItem{
  final String id;
  final String name;
  final String desc;
  final String price;
  final String picture;
  final int orderNum;
  GoodsItem({required this.id,required this.name,required this.desc,required this.price,required this.picture,required this.orderNum});
  factory GoodsItem.formJSON(Map<String,dynamic> json){
    return GoodsItem(
      id: json["id"].toString(),
      name: json["name"]??"",
      desc: json["desc"]??"",
      price: json["price"]??"",
      picture: json["picture"]??"",
      orderNum: json["orderNum"]??0,
    );
  }

}

class GoodsItems{
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;
  GoodsItems({required this.counts,required this.pageSize,required this.pages,required this.page,required this.items});
  factory GoodsItems.formJSON(Map<String,dynamic> json){
    return GoodsItems(
      counts: json["counts"]??"",
      pageSize: json["pageSize"]??"",
      pages: json["pages"]??"",
      page: json["page"]??"",
      items: (json["items"] as List? ??[]).map((item)=>GoodsItem.formJSON(item as Map<String,dynamic>)).toList(),
    );
  }
}

class SubType{
  final String id;
  final String title;
  final GoodsItems goodsItems;
  SubType({required this.id,required this.title,required this.goodsItems});
  factory SubType.formJSON(Map<String,dynamic> json){
    return SubType(
      id: json["id"]??"",
      title: json["title"]??"",
      goodsItems: GoodsItems.formJSON(json["goodsItems"] as Map<String,dynamic>)
    );
  }
}

class SpecialRecommendResult{
  final String id;
  final String title;
  List<SubType> subTypes;
  SpecialRecommendResult({required this.id,required this.title,required this.subTypes});
  factory SpecialRecommendResult.formJSON(Map<String,dynamic> json){
    return SpecialRecommendResult(
      id: json["id"]??"",
      title: json["title"]??"",
      subTypes: (json["subTypes"] as List? ??[]).map((item)=>SubType.formJSON(item as Map<String,dynamic>)).toList(),
    );
  }
}
class GoodDetailItem extends GoodsItem{
  final int payCount;

  GoodDetailItem({required super.id, required super.name, required super.price, required super.picture,required super.orderNum, required this.payCount}):super(desc: "");

  factory GoodDetailItem.formJSON(Map<String,dynamic> json){
    return GoodDetailItem(
      id: json["id"].toString(),
      name: json["name"]??"",
      price: json["price"].toString(),
      picture: json["picture"]??"",
      orderNum: json["orderNum"]??0,
      payCount: json["payCount"]??0,
    );
  }


}
class GoodDetailItems{
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodDetailItem> items;
  GoodDetailItems({required this.counts,required this.pageSize,required this.pages,required this.page,required this.items});
  factory GoodDetailItems.formJSON(Map<String,dynamic> json){
    return GoodDetailItems(
      counts: json["counts"]??"",
      pageSize: json["pageSize"]??"",
      pages: json["pages"]??"",
      page: json["page"]??"",
      items: (json["items"] as List? ??[]).map((item)=>GoodDetailItem.formJSON(item as Map<String,dynamic>)).toList(),
    );
  }
}