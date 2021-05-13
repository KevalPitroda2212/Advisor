import 'dart:async';
import 'dart:io';
import 'package:app_category/Common.dart';
import 'package:app_category/model/SignInModel.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class SignInAPI{
  final String _endPoint = 'api/advisorsignin';
  final String _emailId = 'emailid';
  final String _mobileNumber = 'mobilenumber';
  final String _password = 'password';
  final String _parseString = 'application/x-www-form-urlencoded';

  SignInModel model;

  Future<SignInModel> signIn({String mobileNumber, String password}) async {
    try{
      FormData formData = new FormData.fromMap({
        _emailId : '...',
        _mobileNumber : mobileNumber,
        _password : password
      });

      Dio dio = new Dio(BaseOptions(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'device_token' : 'abc',
          'device_id' : 123,
          'target' : 'debug',
        },
      ));

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      print('dio => ${dio.options.headers}');
      print(formData.fields);

      Response response = await dio.post(
        Common.BASE_URL + _endPoint,
        data: formData,
      );
      print('response => ${response}');

      model = SignInModel.fromJson(response.data);
      print('response.mesage => ${model.message}');

      return model;
    }on DioError catch (e) {
      print(e);
      return null;
    }
  }
}