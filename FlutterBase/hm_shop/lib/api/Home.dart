import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/Home.dart';

Future<List<BannerItem>> getBannerListAPI() async{
  return (await (dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.formJSON(item as Map<String,dynamic>);
  }).toList();
}
Future<List<CategoryItem>> getCategoryListAPI() async{
  return (await (dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.formJSON(item as Map<String,dynamic>);
  }).toList();
}
Future<SpecialRecommendResult> getHotListAPI() async{
  return SpecialRecommendResult.formJSON(
    await dioRequest.get(HttpConstants.HOT_LIST)
  );
}
Future<List<GoodsItem>> getInVogueListAPI() async{
  //极其混沌的写法，后端接口设计的不好，数据结构不合理，导致前端只能写出这种混沌的代码来解析数据
  //疑似黑马程序员在教学之后更改了相关接口，和视频教程不一致
  //Fixed Code
  return ((await dioRequest.get(HttpConstants.IN_VOGUE_LIST))["byDay"] as List).map((item) {
    return GoodsItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}
Future<List<GoodsItem>> getOneStopListAPI() async{
  //Fixed Code
  return (await dioRequest.get(HttpConstants.ONE_STOP_LIST) as List).map((item) {
    return GoodsItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<List<GoodDetailItem>> getRecommendListAPI(Map<String, dynamic> params) async{
  return (await dioRequest.get(HttpConstants.RECOMMEND_LIST,params: params) as List).map((item) {
    return GoodDetailItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}