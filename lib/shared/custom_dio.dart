import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:health/shared/constants.dart';

class CustomDio extends DioForBrowser {
  final Dio dio;

  CustomDio({required this.dio}) {
    options.baseUrl = urlBase;
    options.headers['Authorization'] = 'Bearer $token';
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;
  }
}
