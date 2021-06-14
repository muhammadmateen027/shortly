import 'package:dio/dio.dart';

class ApiException implements Exception {
  static const defaultErrorDetail = 'Something went wrong. Please try again.';
  DioError error;
  ApiException(DioError error){
    this.error = error;
  }

  String getDetail() {
    if(null == error.response){
      return defaultErrorDetail;
    }
    if (!(null != error.response.data && error.response.data is Map) ){
      return defaultErrorDetail;
    }
    if (!error.response.data['ok']){
      return error.response.data['error'];
    }
    if (error.response.data['error_code'] == 1){
      return error.response.data['error'];
    }

    return error.response.data['error'];
  }

  int getStatus() {
    if(DioErrorType.DEFAULT == error.type){
      return 400;
    }

    return error.response.statusCode;
  }

  @override
  String toString(){
    return this.getDetail();
  }
}