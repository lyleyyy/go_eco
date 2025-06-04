

import 'package:dio/dio.dart';

class NetConfig {
  static String baseUrl = 'https://deco3801-shakalakaboom.uqcloud.net/';

  static Future login(String email, String password) async {
    Response response;
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    response = await dio
        .post('login.php', data: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future register(String email, String password, String username) async {
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    var response = await dio
        .post('register.php',
        data: {'email': email, 'password': password, 'username': username});
  }

  static Future checkExist(String email) async {
    Response response;
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    response = await dio
        .post('checkexist.php', data: {'email': email});
    return response;
  }

  static Future insert(String email) async {
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    var response = await dio
        .post('insert.php',
        data: {'email': email});
  }

  static Future grab() async {
    Response response;
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    response = await dio
        .post('lb.php');
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

//wrx
  static Future addSummary(String email, int food, int transport, int
  energy, int total) async {
    Response response;
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    response = await dio
        .post('summary.php',
        data: {'email': email,'food': food, 'transport': transport, 'energy': energy, 'total': total});
  }
  //wrx
  static Future getchart(String email) async {
    Response response;
    var dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.contentType ='application/x-www-form-urlencoded';
    response = await dio
        .post('getchart.php', data: {'email': email});

    return response;
  }
}