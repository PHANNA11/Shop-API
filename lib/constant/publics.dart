import 'package:dio/dio.dart';

const String apiUrl = 'https://fakestoreapi.com';
// mixin AppLimit {
//   static const int REQUEST_TIME_OUT = 30000;
// }
var dio = Dio(BaseOptions(
  baseUrl: apiUrl,
  connectTimeout: const Duration(seconds: 30000),
  receiveTimeout: const Duration(seconds: 30000),
  sendTimeout: const Duration(seconds: 30000),
  headers: apiHeaders,
  contentType: 'application/json',
));

Map<String, String> apiHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
