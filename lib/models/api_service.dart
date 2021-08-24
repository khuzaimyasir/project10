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
        print(response.data);

        for (int i = 0; i < response.data.length; i++) {
          int id = response.data[i]["id"] ?? 0;
          String name = response.data[i]["name"] ?? "nnaamee";
          String desc = response.data[i]["description"] ?? "descdesc";
          int parent = response.data[i]["parent"] ?? 0;
          String image = response.data[i]["image"]["src"] ?? "iimmaaggee";

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

    return data;
  }

  Future<List<Product>> getProducts(String tagId) async {
    List<Product> data = <Product>[];
    try {
      String url = Config.url +
          Config.productURL +
          "?consumer_key=${Config.Key}&consumer_secret=${Config.consumerSecret}&tag=${Config.todaysOffersTagId}";
      print("urlurl");
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
        print("Succes product");
        print(response.data[0]);

        print("hHAHA");

        String id, name, slug, permalink, description, shortDescription;

        for (int i = 0; i < response.data.length; i++) {
          id = response.data[i]["id"].toString();
          name = response.data[i]["name"].toString();
          slug = response.data[i]["slug"].toString();
          permalink = response.data[i]["permalink"].toString();
          description = response.data[i]["description"].toString();
          shortDescription = response.data[i]["short_description"].toString();

          print(id);
          print(name);
          print(slug);
          print(permalink);
          print(description);
          print(shortDescription);

          data.add(new Product(
              id: id,
              name: name,
              slug: slug,
              permalink: permalink,
              description: description,
              shortDescription: shortDescription));
        }

        // for (int i = 0; i < response.data.length; i++) {
        //   String tagId = response.data[i]["tagid"] ?? "nnd";
        //   print(tagId);
        //   int id = response.data[i]["id"] ?? 0;
        //   print(id);
        //   String name = response.data[i]["name"] ?? "nnaamee";
        //   print(name);
        //   String description = response.data[i]["description"] ?? "descdesc";
        //   print(description);
        //   int sku = response.data[i]["skuu"] ?? 0;
        //   print(sku);
        //   String image = response.data[i]["image"]["src"] ?? "iimmaaggee";
        //   print(image);
        //   String regularPrice =
        //       response.data[i]["regularp"]["src"] ?? "iimmaaggee";
        //   print(regularPrice);
        //   int salePrice = response.data[i]["salep"] ?? 0;
        //   print(salePrice);

        //   data.add(new Product(APIservice)
        //      );
        //   }
        // }
        // data = (response.data as List)
        //     .map(
        //       (i) => new Product.fromJson(i),
        //     )
        //     .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
}
