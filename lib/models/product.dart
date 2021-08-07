import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final String shortDescription;
  final String sku;
  final String price;
  final String regularPrice;
  final String salePrice;
  final String stockStatus;
  List<Images> images;
  List<categories> categories;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.price,
    required this.salePrice,
    required this.regularPrice,
    required this.stockStatus,
  });

  Product.fromJson(i, {required Map<String, dynamic> parsedJson})
      : id = parsedJson['id'],
        name = parsedJson['name'],
        description = parsedJson['description'],
        sku = parsedJson['parent'],
        price = parsedJson['image'],
        salePrice = parsedJson['image'];

        if (json['categories']!) { 
          categories= new List<categories>();
          json['categories'].forEach((v){
            categories.add(new categories.fromJson(v));

          }
          );
          if (json['images']!) { 
          categories= new List<images>();
          json['categories'].forEach((v){
            categories.add(new images.fromJson(v));

          }
          );
             }
            }
          }    

// ignore: camel_case_types
class categories {
  int id;
  String name;

  categories({
    required this.id,
        required this.name,
  });
  categories.fromJson({required Map<String, dynamic> parsedJson}){
       id = parsedJson['id'],
      //   : with id removed
        name = parsedJson['name'];

}
 
 Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id'] =  required this.id;
     data['name'] = required this.id;
     return data;
 }
 }
 
 class Images{
  String src;

  Images({
     required this.src,
  })
 


Images.fromJson({required Map<String, dynamic> parsedJson}){
       src = parsedJson['src'];
}
 }