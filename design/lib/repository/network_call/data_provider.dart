import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_exception.dart';

class DataProviderClient {
  final Dio dio;

  DataProviderClient({@required this.dio}) : assert(dio != null);

  Future<Response> get(
    String url, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {

    try {
      return await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (error) {
      throw ApiException(error);
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {

    try {
      return await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (error) {
      throw ApiException(error);
    }
  }
}
