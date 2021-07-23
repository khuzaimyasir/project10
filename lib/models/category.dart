

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

class Imagee {
   String url;


   Imagee({
    required this.url,
  });
Imagee.fromJson({required Map<String, dynamic> parsedJson})
 :url = parsedJson['url'];

}
