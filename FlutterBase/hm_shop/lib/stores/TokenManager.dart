import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  String _token = "";
  Future<SharedPreferences> _getInstance(){
    return SharedPreferences.getInstance();
  }  
  Future<void> init() async{
    final prefs = await _getInstance();
    _token =  prefs.getString(GlobalConstants.TOKEN_KEY)??"";
  }
  Future<void> setToken(String val) async{
    final prefs = await _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY,val);
    _token = val;
  }
  String getToken(){
    // 后续会在Dio请求工具中进行注入，这里使用异步会导致之后数据类型异常
    // 所以在初始构成token时进行
    // final prefs = await _getInstance();
    // return prefs.getString(GlobalConstants.TOKEN_KEY);
    return _token;
  }
  Future<void> removeToken() async{
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = "";
  }
}
final tokenManager = TokenManager();