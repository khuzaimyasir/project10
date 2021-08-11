import 'dart:io';

import 'package:project_10/config/config.dart';
import 'package:project_10/models/category.dart';
import 'package:dio/dio.dart';
import 'package:project_10/models/product.dart';
import 'category.dart';

class APIservice {
  Future<List<Category>> getCategories() async {
    List<Category> data = <Category>[];
    try {
      String url = Config.url +
          Config.categoriesURL +
          "?consumer_key=${Config.Key}&consumer_secret=${Config.consumerSecret}";
      print(url);
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Success");
        print(response.data[0].runtimeType);
        print(response.data);

        for (int i = 0; i < response.data.length; i++) {
          int id = response.data[i]["id"] ?? 0;
          print(id);
          String name = response.data[i]["name"] ?? "nnaamee";
          print(name);
          String desc = response.data[i]["description"] ?? "descdesc";
          print(desc);
          int parent = response.data[i]["parent"] ?? 0;
          print(parent);
          String image = response.data[i]["image"]["src"] ?? "iimmaaggee";
          print(image);

          data.add(new Category(
              categoryId: id,
              categoryName: name,
              categoryDesc: desc,
              parent: parent,
              image: image));
        }
        // data = (response.data)
        //     .map(
        //       (i) => Category.fromJson(parsedJson: response.data[i]),
        //     )
        //     .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    print("data:");
    print(data);
    return data;
  }

  Future<List<Product>> getProducts(String tagId) async {
    List<Product> data = <Product>[];
    try {
      String url = Config.url +
          Config.categoriesURL +
          "?consumer_key=${Config.Key}&consumer_secret=${Config.consumerSecret}&tag=$tagId";
      print(tagId);
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Success");
        print(response.data[0].runtimeType);
        print(response.data);

        for (int i = 0; i < response.data.length; i++) {
          int id = response.data[i]["id"] ?? 0;
          print(id);
          String name = response.data[i]["name"] ?? "nnaamee";
          print(name);
          String description = response.data[i]["description"] ?? "descdesc";
          print(description);
          int sku = response.data[i]["skuu"] ?? 0;
          print(sku);
          String image = response.data[i]["image"]["src"] ?? "iimmaaggee";
          print(image);
          String regularPrice =
              response.data[i]["regularp"]["src"] ?? "iimmaaggee";
          print(regularPrice);
          int salePrice = response.data[i]["salep"] ?? 0;
          print(salePrice);

          data.add(new Product(
            id: id,
            name: name,
            description: description,
          ));
        }
      }

      //  data = (response.data as List )
      //       .map(
      //         (i) => Product.fromJson(i),
      //       )
      //       .toList();
      //  }

    } on DioError catch (e) {
      print(e.response);
    }
    print("kys:");
    print(data);
    return data;
  }}
