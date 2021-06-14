import 'package:design/repository/network_call/network_call.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoggingInterceptors extends Interceptor {
  int currentRequests = 0;

  @override
  Future onRequest(RequestOptions options) {
    EasyLoading.instance..backgroundColor = Colors.transparent;

    if (options.extra['customProgress'] == false) {
      return super.onRequest(options);
    }

    ++currentRequests;
    EasyLoading.show(maskType: EasyLoadingMaskType.custom);

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response.request.extra['customProgress'] == false) {
      return super.onResponse(response);
    }

    --currentRequests;
    if (0 >= currentRequests) {
      EasyLoading.dismiss();
    }

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    EasyLoading.instance..backgroundColor = Colors.red;
    EasyLoading.showError(ApiException(err).getDetail(), dismissOnTap: true);

    if (err.request.extra['customProgress'] == false) {
      return super.onError(err);
    }

    --currentRequests;
    if (0 >= currentRequests) {
      EasyLoading.dismiss();
    }

    return super.onError(err);
  }
}
