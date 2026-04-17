import 'package:get/state_manager.dart';
import 'package:hm_shop/viewmodels/User.dart';

class UserCntroller extends GetxController{
  var user = User.fromJSON({}).obs;
  void updateUser(User newUser){
    user.value = newUser;
  }
}