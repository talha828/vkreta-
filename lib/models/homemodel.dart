// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.logoLink,
    this.topCategories,
    this.layout,
  });

  String? logoLink;
  List<TopCategory>? topCategories;
  List<Layout>? layout;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    logoLink: json["logo_link"],
    topCategories: List<TopCategory>.from(json["top_categories"].map((x) => TopCategory.fromJson(x))),
    layout: List<Layout>.from(json["layout"].map((x) => Layout.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "logo_link": logoLink,
    "top_categories": List<dynamic>.from(topCategories!.map((x) => x.toJson())),
    "layout": List<dynamic>.from(layout!.map((x) => x.toJson())),
  };
}

class Layout {
  Layout({
    this.title,
    this.layout,
    this.sort,
    this.column,
    this.data,
  });

  String? title;
  String? layout;
  String? sort;
  String? column;
  dynamic data;

  factory Layout.fromJson(Map<String, dynamic> json) => Layout(
    title: json["title"],
    layout: json["layout"],
    sort: json["sort"],
    column: json["column"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "layout": layout,
    "sort": sort,
    "column": column,
    "data": data,
  };
}

class DatumElement {
  DatumElement({
    this.name,
    this.image,
    this.link,
  });

  String? name;
  String? image;
  String? link;

  factory DatumElement.fromJson(Map<String, dynamic> json) => DatumElement(
    name: json["name"],
    image: json["image"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "link": link,
  };
}

class DatumValue {
  DatumValue({
    this.productId,
    this.name,
    this.quantity,
    this.stockStatus,
    this.thumb,
    this.secondThumb,
    this.priceValue,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.dateEnd,
    this.href,
  });

  String? productId;
  String? name;
  String? quantity;
  String? stockStatus;
  String? thumb;
  String? secondThumb;
  bool? priceValue;
  String? description;
  String? price;
  String? special;
  bool? tax;
  int? minimum;
  int? rating;
  dynamic dateEnd;
  String? href;

  factory DatumValue.fromJson(Map<String, dynamic> json) => DatumValue(
    productId: json["product_id"],
    name: json["name"],
    quantity: json["quantity"],
    stockStatus: json["stock_status"],
    thumb: json["thumb"],
    secondThumb: json["second_thumb"],
    priceValue: json["price_value"],
    description: json["description"],
    price: json["price"],
    special: json["special"],
    tax: json["tax"],
    minimum: json["minimum"],
    rating: json["rating"],
    dateEnd: json["date_end"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "quantity": quantity,
    "stock_status": stockStatus,
    "thumb": thumb,
    "second_thumb": secondThumb,
    "price_value": priceValue,
    "description": description,
    "price": price,
    "special": special,
    "tax": tax,
    "minimum": minimum,
    "rating": rating,
    "date_end": dateEnd,
    "href": href,
  };
}

class TopCategory {
  TopCategory({
    this.categoryId,
    this.name,
    this.image,
  });

  String? categoryId;
  String? name;
  String? image;

  factory TopCategory.fromJson(Map<String, dynamic> json) => TopCategory(
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "name": name,
    "image": image,
  };
}
