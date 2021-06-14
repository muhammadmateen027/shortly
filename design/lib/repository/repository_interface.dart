import 'package:dio/dio.dart';

abstract class RepositoryInterface {
  Future<Response> shortenUrl(String url);
}

