

import 'package:dio/dio.dart';

class Client {

  static final Client _instance = Client._internal();

  Dio dio = Dio();

  factory Client() {
    return _instance;
  }

  Client._internal() {
    // initialization logic
  }






}