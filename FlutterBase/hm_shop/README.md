## hm_shop

根着黑马程序员训练的项目。

## dio数据处理

1. 安装dio
2. 定义常量数据:基础地址、超时时间、业务状态、请求地址
    1. 参照 `constants` 文件夹中的写法，请求地址各有个的不同，写在 `HttpConstants`
    2. 如果有皮肤设置，也可以分别写成 `skinLightConstants` 与 `skinDarkConstants`
3. 封装网络请求工具、配置以及拦截器
4. 进一步解构，处理http状态与业务状态
    1. 主要看后端返回数据的搭配，基础http响应码在上一步中拦截
    2. http码是正常，不意味着返回的数据是正确的（比如后端报错，但前端仍旧200），再次判断业务码是否正确，顺便处理数据，参照 `DioRequest._handleResponse()` 处理数据
5. 类工厂转化动态类型到对象类型
    1. Dart是强类型代码，无法隐式转化，需要手动进行数据处理，写法参照 `viewmodels/Home.dart` 
    2. 也可以使用插件 `Freezed` 自动处理
6. 封装请求API调用工厂函数
    1. 用于统一处理，增加可读性
7. 初始化数据并更新状态

## 上拉加载

1. 使用原有构筑的接口实现 `_getRecommendList()`
2. 监听滚动到底部事件
3. 同时只能加载一个请求
    1. 防止反复下拉加载数据
4. 如果没有下一页就终止请求

## 下拉刷新

1. 如果仅仅为了获取数据，不建议使用Globalkey来控制加载
2. flutter推荐手势控制UI驱动事件，而不是使用 `_key.currentState?.show()` UI反过来驱动事件
3. 当然如果想在首次进入页面时加载对应下拉动画是可以的。

## 登录界面

1. 跟原来不同的是使用了 `Form` 组件包裹，然后用 `TextFormField` 提交校验
2. 然后使用 `GlobalKey` 绑定调用 `valiate()`
3. 再用 `TextFormField` 的 `validator` 返回校验文本。 
    1. 校验使用正则 `RegExp('')`

Tips: 登录账户 132\[7*0\]1~9 密码 123456

## Getx

0. **本处仅仅只是介绍并使用了一部分方法，实际上这个插件有很多功能，且这次用的方法并不是最佳选择，还请自行查阅。**
1. 安装getx插件 `flutter pub add get`
2. 定义一个继承 `GetxController` 的对象
3. 对象中定义需要共享的属性
4. 数据需要响应式更新 - 需要给初始值 `.obs` 接尾
5. UI显示Getx数据需使用 `Obx` 包裹函数中使用
    1. 如果需要要数据响应（不需要数据进行UI更新）可以不使用。
6. UI中使用Getx需要一个 `put` 和 `find` 函数动作
7. 必须先put一次，才可以find
8. put只能有一次，find可多次
    1. 所以在这个项目里不应该在“我的”页面中put，而是在“首页”页面中put。

## 数据持久化Token

1. 安装 `shared_preferences` 插件
2. 封装一个 `TokenManager` 工具，具备初始化/设置/获取/删除方法
3. 登陆成功将token写入持久化
4. 封装获取用户信息API
5. Dio再请求工具中进行token注入
6. 在应用首页判断token获取状态赋值Getx数据
7. 调整我的页面的Getx的put方式为find
    1. 修正了上一项的第8条

## 退出登录

1. 就是要清空Getx数据与token数据
2. 关闭弹窗然后返回界面即可。

## 事后勘误

原视频是2025/10/15更新完毕的（？），于是乎部分代码接口出现了返回结果不同、返回结果中属性类型不一致的情况，个人已修正，如果无法运行，请自主打印api信息进行调整。

修正位置参考：搜索 `//Fixed Code`

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
