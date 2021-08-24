class Product {
  final String id, name, slug, permalink, description, shortDescription;

  Product({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.description,
    this.shortDescription,
  });

  Product.fromJson(Map<String, dynamic> parsedJson) 
  : id = parsedJson['id'],
    name = parsedJson['name'],
    slug = parsedJson['slug'],
    permalink = parsedJson['permalink'],
    description =parsedJson['description'],
    shortDescription = parsedJson['short_description'];
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
