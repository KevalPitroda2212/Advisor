import 'dart:async';
import 'package:app_category/Common.dart';
import 'package:app_category/model/SubCategoryModel.dart';
import 'package:dio/dio.dart';

class SubCategoryAPI{
  final String _endPoint = 'api/SubCategory';
  final String _categoryId = 'CategoryId';
  final String _auth = 'bearer oB1UIJrBTmIxihiHoIv5WFiFSTfr-QmO-w4uxteAkiEyKgMlei-zuB2um1BZCF7nFLXRJ9qMGIvThyk9fOf74XMHzZqyGSqZNFTCx9vOsTlbKoCBeZiScNMFSMaxwXrSZIRjtUYLfCWQ89TviepEBHU4zfu3oBrwPQlXbZVDZkGyJVVb7BNRvgPPMQyYyJkiVct78tUnF6Mm0R38yu7Ja3ZYKXQ8ANVHMLr_o0i6D71HHTAjIkx7bBu1hm14FPZBkGswOgrdh2KkOZ-OG-wifi8roaSS83p3mygb1SuOG3nnXd9KtpesAgA6DGxNuygEJNJHtRQ4EBIgLMdRljowRbfCrQtVUThS84DPXA5lKEi5ka1WK5QKzVZxeY3A2eLDGCaW7XQW5zSznGcOYvcUXA';

  SubCategoryModel model;

  Future<SubCategoryModel> getSubCateory({int categoryId}) async {
    try{

      Dio dio = new Dio(BaseOptions(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'device_token' : 'abc',
          'device_id' : 123,
          'target' : 'debug',
          'Authorization' : _auth,
        },
      ));

      print('dio => ${dio.options.headers}');

      Response response = await dio.post(
        Common.BASE_URL + _endPoint,
        data: {_categoryId : categoryId},
      );

      model = SubCategoryModel.fromJson(response.data);
      print('response.mesage => ${model.message}');

      return model;
    }on DioError catch (e) {
      print(e);
      return null;
    }
  }
}