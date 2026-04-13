import 'package:dio/dio.dart';

class DioUtils{
  final Dio _dio = Dio();
  DioUtils(){
    //做些基础操作
    //配置基础地址和超时时间
    _dio.options..baseUrl = "https://geek.itheima.net/v1_0/"
    ..connectTimeout = Duration(seconds: 10)//连接超时
    ..sendTimeout = Duration(seconds: 10)//发送超时
    ..receiveTimeout = Duration(seconds: 10);//接收超时
    //拦截器
    _addInterceptor();
  }
  void _addInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
      //请求拦截
      //放至下一个拦截 handler.next(requestOptions);
      //拦截 handler.reject(error);
      onRequest: (options, handler) {
        if(options.data==null){
          //sendTimeout cannot be used without a request body to send on Web
          //get访问没有body，post和put有
          options.sendTimeout = null;
        }
        handler.next(options);
      },
      //响应拦截
      onResponse: (response, handler) {
        //http状态码 成功:2xx 缓存异常:3xx 请求参数异常:4xx 服务器异常:5xx
        if(response.statusCode! >=200 && response.statusCode!<300){
          handler.next(response);
          return;
        }
        handler.reject(DioException(requestOptions: response.requestOptions));

      },
      //错误拦截
      onError: (error, handler) {
        handler.reject(error);
      },
    ));
  }
  Future<Response<dynamic>> get(String url,{Map<String,dynamic>? params}){
    return _dio.get(url,queryParameters: params);
  }
}
