import 'package:vkreta/models/sliderModel.dart';

class HomeModel {
  String? logoLink;
  String? whatsappNumber;
  List<TopCategories>? topCategories;
  List<Layout>? layout;
  SliderModel? slider;

  HomeModel(
      {this.logoLink, this.whatsappNumber, this.topCategories, this.layout,this.slider});

  HomeModel.fromJson(Map<String, dynamic> json) {
    logoLink = json['logo_link'];
    whatsappNumber = json['whatsapp_number'];
    if (json['top_categories'] != null) {
      topCategories = <TopCategories>[];
      json['top_categories'].forEach((v) {
        topCategories!.add(new TopCategories.fromJson(v));
      });
    }
    if (json['layout'] != null) {
      layout = <Layout>[];
        slider= SliderModel.fromJson(json['layout'][0]);
       int i=0;
       for(var j in json['layout']){
         if(i>0 && i<5){
           layout!.add(new Layout.fromJson(j));
         }
         i++;
         print(i);
       }

      //   json['layout'].forEach((v) {
      //
      // });
    }
  }


}

class TopCategories {
  String? categoryId;
  String? name;
  String? image;

  TopCategories({this.categoryId, this.name, this.image});

  TopCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Layout {
  String? title;
  String? layout;
  String? sort;
  String? column;
  List<Data>? data;

  Layout({this.title, this.layout, this.sort, this.column, this.data});

  Layout.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    layout = json['layout'];
    sort = json['sort'];
    column = json['column'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['layout'] = this.layout;
    data['sort'] = this.sort;
    data['column'] = this.column;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? productId;
  String? quantity;
  String? stockStatus;
  String? thumb;
  String? secondThumb;
  bool? priceValue;
  String? description;
  String? price;
  String? special;
  bool? tax;
  String? minimum;
  int? rating;
  Null? dateEnd;
  String? href;

  Data(
      {this.name,
        this.productId,
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
        this.href});

  Data.fromJson(Map<String, dynamic> json) {
   try{
     name = json['name'];
     productId = json['product_id'];
     quantity = json['quantity'];
     stockStatus = json['stock_status'];
     thumb = json['thumb'];
     secondThumb = json['second_thumb'].toString();
     priceValue = json['price_value'];
     description = json['description'];
     price = json['price'];
     special = json['special'];
     tax = json['tax'];
     minimum = json['minimum'].toString();
     rating = json['rating'];
     dateEnd = json['date_end'];
     href = json['href'];
   }catch(e){
     print(e.toString());
   }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['stock_status'] = this.stockStatus;
    data['thumb'] = this.thumb;
    data['second_thumb'] = this.secondThumb;
    data['price_value'] = this.priceValue;
    data['description'] = this.description;
    data['price'] = this.price;
    data['special'] = this.special;
    data['tax'] = this.tax;
    data['minimum'] = this.minimum;
    data['rating'] = this.rating;
    data['date_end'] = this.dateEnd;
    data['href'] = this.href;
    return data;
  }
}
