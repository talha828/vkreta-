import 'Categories.dart';
import 'Products.dart';
import 'Filter.dart';

class TopCategoryModel {
  TopCategoryModel({
      this.categoryName, 
      this.thumb, 
      this.description, 
      this.categories, 
      this.productTotal, 
      this.products, 
      this.imageWidth, 
      this.imageHeight, 
      this.dummyImage, 
      this.sort, 
      this.order, 
      this.limit, 
      this.filter,});

  TopCategoryModel.fromJson(dynamic json) {
    categoryName = json['category_name'];
    thumb = json['thumb'];
    description = json['description'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    productTotal = json['product_total'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    imageWidth = json['image_width'].toString();
    imageHeight = json['image_height'].toString();
    dummyImage = json['dummy_image'];
    sort = json['sort'];
    order = json['order'];
    limit = json['limit'];
    if (json['filter'] != null) {
      filter = [];
      json['filter'].forEach((v) {
        filter!.add(Filter.fromJson(v));
      });
    }
  }
  String? categoryName;
  String? thumb;
  String? description;
  List<Categories>? categories;
  String? productTotal;
  List<Products>? products;
  String? imageWidth;
  String? imageHeight;
  String? dummyImage;
  String? sort;
  String? order;
  String? limit;
  List<Filter>? filter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = categoryName;
    map['thumb'] = thumb;
    map['description'] = description;
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    map['product_total'] = productTotal;
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    map['image_width'] = imageWidth;
    map['image_height'] = imageHeight;
    map['dummy_image'] = dummyImage;
    map['sort'] = sort;
    map['order'] = order;
    map['limit'] = limit;
    if (filter != null) {
      map['filter'] = filter!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}