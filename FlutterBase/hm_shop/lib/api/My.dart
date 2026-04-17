import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/Home.dart';

Future<GoodDetailItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodDetailItems.formJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}