class PayBase{
  void pay(){
    print("base pay");
  }
}
class WeChatPay extends PayBase{
  @override
  void pay() {
    print("wechat pay");
  }
}
class AliPay extends PayBase{
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