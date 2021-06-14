import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'repository_interface.dart';
import 'network_call/data_provider.dart';

class UserRepository implements RepositoryInterface {
  final DataProviderClient dataProviderClient;

  UserRepository({@required this.dataProviderClient})
      : assert(dataProviderClient != null);

  @override
  Future<Response> shortenUrl(String url) async {
    return await dataProviderClient.get(
      '${env['API_URL']}/shorten',
      queryParameters: {'url': url},
    );
  }
}
