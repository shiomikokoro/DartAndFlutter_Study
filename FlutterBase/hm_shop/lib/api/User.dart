import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/User.dart';

Future<User> loginAPI(Map<String,dynamic> data) async{
  return User.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data)
  );
}
Future<User> getUserAPI() async{
  return User.fromJSON(
    await dioRequest.get(HttpConstants.USER_PROFILE)
  );
}