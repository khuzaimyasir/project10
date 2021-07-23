import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();

 CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> ?items;
  // Get Item by ID
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  Item getByPosition(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final num oldprice;
  final String detail;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.oldprice,
    required this.detail,
    required this.color,
    required this.image,
  });

  Item copyWith({
    required int id,
    required String name,
    required String desc,
    required num price,
    required num oldprice,
    required String detail,
    required String color,
    required String image,
  }) {
    return Item(
      id: id,
      name: name,
      desc: desc,
      price: price,
      oldprice: oldprice,
      detail: detail,
      color: color,
      image: image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'oldprice': oldprice,
      'detail': detail,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison
    // if (map == null) return null;

    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      oldprice: map['oldprice'],
      detail: map['detail'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price,, oldprice: $oldprice, detail:$detail, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.price == price &&
        o.oldprice == oldprice &&
        o.detail == detail &&
        o.color == color &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
         oldprice.hashCode ^
        detail.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}


