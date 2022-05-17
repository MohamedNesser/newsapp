import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Diohalper {
  static Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://newsapi.org/'));
  }

  static Future<Response> getData({
    @required String url, @required dynamic query}) async {
    return await dio.get(url, queryParameters: query);
  }

}
