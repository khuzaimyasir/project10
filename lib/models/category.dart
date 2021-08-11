
// import 'dart:convert';


class Category {
  final int categoryId;
  final int parent;
  final String categoryName;
  final String categoryDesc;
  final String image;

  const Category({
     this.categoryId,
    this.categoryName,
     this.categoryDesc,
     this.parent,
     this.image,
  });

  Category.fromJson(i, {Map<String, dynamic> parsedJson})
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
    this.url,
  });
image.fromJson({ Map<String, dynamic> parsedJson})
 :url = parsedJson['url'];

}