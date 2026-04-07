//抽象类
abstract class PayBase{
  void pay();
}
//实现方法。
class WeChatPay implements PayBase{
  @override
  void pay() {
    print("wechat pay");
  }
}
class AliPay implements PayBase{
  @override
  void pay() {
    print("Alipay pay");
  }
}

void main(List<String> args) {
  PayBase wx = WeChatPay();
  PayBase alipay = AliPay();
  wx.pay();//wechat pay
  alipay.pay();//Alipay pay
}