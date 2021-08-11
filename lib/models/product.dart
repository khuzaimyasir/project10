class Product {
  int id;
  String name;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  String stockStatus;
  List<Images> images;
  List<Categories> categories;

  Product(Type int, {
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.salePrice,
    this.regularPrice,
    this.stockStatus,
  });

  Product.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    description =parsedJson['description'];
    sku = parsedJson['sku'];
    price = parsedJson['price'];
    salePrice = parsedJson['salePrice'];
    regularPrice = parsedJson['regularPrice'];

    if (parsedJson['categories'] != null) {

      categories = <Categories>[];
      parsedJson['categories'].forEach((v) {
        categories.add(new Categories.fromJson());
      });
    }
    if (parsedJson['images'] != null) {
    
      images = <Images>[];
      parsedJson['categories'].forEach((v) {
        images.add(new Images.fromJson());
      });
    }
  }
}

class Categories {
  int id;
  String name;

  Categories({
    this.id,
    this.name,
  });
  Categories.fromJson({Map<String, dynamic> json}) {
    id = json['id'];
    //   : with id removed
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.id;
    return data;
  }
}

class Images {
  String src;

  Images({
    this.src,
  });

  Images.fromJson({Map<String, dynamic> json}) {
    src = json['src'];
  }
}
