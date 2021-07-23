import 'dart:io';

import 'package:project_10/config/config.dart';
import 'package:project_10/models/category.dart';

import 'package:dio/dio.dart';
// import 'package:project_10/config/config.dart';
// try http
import 'category.dart';

class APIservice {
  Future<List<Category>> getCategories() async {
    List<Category> data = <Category>[];
    try {
      String url = Config.url +
          Config.categoriesURL +
          "?consumer_key=${Config.Key}&consumer_secret=${Config.consumerSecret}";
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Category.fromJson(i, parsedJson: {}),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
}
