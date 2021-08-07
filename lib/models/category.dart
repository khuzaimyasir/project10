
// import 'dart:convert';


class Category {
  final int categoryId;
  final int parent;
  final String categoryName;
  final String categoryDesc;
  final String image;

  const Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDesc,
    required this.parent,
    required this.image,
  });

  Category.fromJson(i, {required Map<String, dynamic> parsedJson})
      : categoryId = parsedJson['id'],
        categoryName = parsedJson['name'],
        categoryDesc = parsedJson['description'],
        parent = parsedJson['parent'],
        image = parsedJson['image'];
}


// ignore: camel_case_types
class image {
   String url;


   image({
    required this.url,
  });
image.fromJson({required Map<String, dynamic> parsedJson})
 :url = parsedJson['url'];

}