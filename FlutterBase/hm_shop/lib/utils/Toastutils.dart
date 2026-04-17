import 'package:flutter/material.dart';

class Toastutils {
  //当前问题，防止了重复点击，但如果同一时间多处调用该类会被屏蔽掉
  //后续加入ID、传回的文本或者识别符来区分不同的调用防止吞掉消息
  static bool showLoading = false;
  static void showToast(String? message, BuildContext context) {
    if (Toastutils.showLoading) {
      return;
    }
    Toastutils.showLoading = true;
    Future.delayed(Duration(seconds: 2), () {
      Toastutils.showLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: 400,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message ?? "加载中",textAlign: TextAlign.center,)
    ));
  }
}