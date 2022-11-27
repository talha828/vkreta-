// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    this.productId,
    this.headingTitle,
    this.textMinimum,
    this.textLogin,
    this.tabReview,
    this.reviewsTotals,
    this.manufacturer,
    this.manufacturers,
    this.model,
    this.reward,
    this.quantity,
    this.points,
    this.description,
    this.stock,
    this.popup,
    this.thumb,
    this.images,
    this.price,
    this.special,
    this.options,
    this.minimum,
    this.reviewStatus,
    this.reviewGuest,
    this.customerName,
    this.reviews,
    this.rating,
    this.captcha,
    this.share,
    this.attributeGroups,
    this.products,
    this.tags,
    this.wishlist,
    this.buttonDeliver,
    this.ptsQuickStatus,
    this.sellerReviewStatus,
    this.modulePurpletreeMultivendorHideSellerDetail,
    this.sellerDetail,
    this.modulePurpletreeMultivendorAllowLiveChat,
    this.storeLiveChatEnable,
    this.storeLiveChatCode,
    this.templateProductStatus,
    this.recurrings,
    this.productsBottomTab,
    this.disclaimer,
    this.specialSection,
    this.returnPolicy,
  });

  int? productId;
  String? headingTitle;
  String? textMinimum;
  String? textLogin;
  String? tabReview;
  dynamic reviewsTotals;
  String? manufacturer;
  String? manufacturers;
  String? model;
  dynamic reward;
  String? quantity;
  String? points;
  String? description;
  String? stock;
  String? popup;
  String? thumb;
  List<ImageData>? images;
  String? price;
  String? special;
  List<dynamic>? options;
  dynamic? minimum;
  String? reviewStatus;
  bool? reviewGuest;
  String? customerName;
  String? reviews;
  int? rating;
  String? captcha;
  String? share;
  List<dynamic>? attributeGroups;
  List<dynamic>? products;
  List<Tag>? tags;
  List<dynamic>? wishlist;
  String? buttonDeliver;
  dynamic ptsQuickStatus;
  String? sellerReviewStatus;
  String? modulePurpletreeMultivendorHideSellerDetail;
  SellerDetail? sellerDetail;
  String? modulePurpletreeMultivendorAllowLiveChat;

  String? storeLiveChatEnable;
  String? storeLiveChatCode;
  int? templateProductStatus;
  List<dynamic>? recurrings;
  List<ProductsBottomTab>? productsBottomTab;
  String? disclaimer;
  List<SpecialSection>? specialSection;
  String? returnPolicy;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        productId: json["product_id"],
        headingTitle: json["heading_title"],
        textMinimum: json["text_minimum"],
        textLogin: json["text_login"],
        tabReview: json["tab_review"],
        reviewsTotals: json["reviews_totals"],
        manufacturer: json["manufacturer"],
        manufacturers: json["manufacturers"],
        model: json["model"],
        reward: json["reward"],
        quantity: json["quantity"],
        points: json["points"],
        description: json["description"],
        stock: json["stock"],
        popup: json["popup"],
        thumb: json["thumb"],
        images: List<ImageData>.from(json["images"].map((x) => ImageData.fromJson(x))),
        price: json["price"],
        special: json["special"],
        options: List<dynamic>.from(json["options"].map((x) => x)),
        minimum: json["minimum"],
        reviewStatus: json["review_status"],
        reviewGuest: json["review_guest"],
        customerName: json["customer_name"],
        reviews: json["reviews"],
        rating: json["rating"],
        captcha: json["captcha"],
        share: json["share"],
        attributeGroups: List<dynamic>.from(json["attribute_groups"].map((x) => x)),
        products: List<dynamic>.from(json["products"].map((x) => x)),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        wishlist: List<dynamic>.from(json["wishlist"].map((x) => x)),
        buttonDeliver: json["button_deliver"],
        ptsQuickStatus: json["pts_quick_status"],
        sellerReviewStatus: json["seller_review_status"],
        modulePurpletreeMultivendorHideSellerDetail: json["module_purpletree_multivendor_hide_seller_detail"],
        sellerDetail: SellerDetail.fromJson(json["seller_detail"]),
        modulePurpletreeMultivendorAllowLiveChat: json["module_purpletree_multivendor_allow_live_chat"],
        storeLiveChatEnable: json["store_live_chat_enable"],
        storeLiveChatCode: json["store_live_chat_code"],
        templateProductStatus: json["template_product_status"],
        recurrings: List<dynamic>.from(json["recurrings"].map((x) => x)),
        productsBottomTab: List<ProductsBottomTab>.from(json["products_bottom_tab"].map((x) => ProductsBottomTab.fromJson(x))),
        disclaimer: json["disclaimer"],
        specialSection: List<SpecialSection>.from(json["special-section"].map((x) => SpecialSection.fromJson(x))),
        returnPolicy: json["return_policy"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "heading_title": headingTitle,
        "text_minimum": textMinimum,
        "text_login": textLogin,
        "tab_review": tabReview,
        "reviews_totals": reviewsTotals,
        "manufacturer": manufacturer,
        "manufacturers": manufacturers,
        "model": model,
        "reward": reward,
        "quantity": quantity,
        "points": points,
        "description": description,
        "stock": stock,
        "popup": popup,
        "thumb": thumb,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "price": price,
        "special": special,
        "options": List<dynamic>.from(options!.map((x) => x)),
        "minimum": minimum,
        "review_status": reviewStatus,
        "review_guest": reviewGuest,
        "customer_name": customerName,
        "reviews": reviews,
        "rating": rating,
        "captcha": captcha,
        "share": share,
        "attribute_groups": List<dynamic>.from(attributeGroups!.map((x) => x)),
        "products": List<dynamic>.from(products!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "wishlist": List<dynamic>.from(wishlist!.map((x) => x)),
        "button_deliver": buttonDeliver,
        "pts_quick_status": ptsQuickStatus,
        "seller_review_status": sellerReviewStatus,
        "module_purpletree_multivendor_hide_seller_detail": modulePurpletreeMultivendorHideSellerDetail,
        "seller_detail": sellerDetail!.toJson(),
        "module_purpletree_multivendor_allow_live_chat": modulePurpletreeMultivendorAllowLiveChat,
        "store_live_chat_enable": storeLiveChatEnable,
        "store_live_chat_code": storeLiveChatCode,
        "template_product_status": templateProductStatus,
        "recurrings": List<dynamic>.from(recurrings!.map((x) => x)),
        "products_bottom_tab": List<dynamic>.from(productsBottomTab!.map((x) => x.toJson())),
        "disclaimer": disclaimer,
        "special-section": List<dynamic>.from(specialSection!.map((x) => x.toJson())),
        "return_policy": returnPolicy,
      };
}

class ImageData {
  ImageData({
    this.popup,
    this.thumb,
  });

  String? popup;
  String? thumb;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        popup: json["popup"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "popup": popup,
        "thumb": thumb,
      };
}

class ProductsBottomTab {
  ProductsBottomTab({
    this.title,
    this.products,
  });

  String? title;
  List<Product>? products;

  factory ProductsBottomTab.fromJson(Map<String, dynamic> json) => ProductsBottomTab(
        title: json["title"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId,
    this.thumb,
    this.quantity,
    this.name,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.href,
  });

  String? productId;
  String? thumb;
  String? quantity;
  String? name;
  String? description;
  String? price;
  dynamic special;
  bool? tax;
  int? minimum;
  int? rating;
  String? href;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        thumb: json["thumb"],
        quantity: json["quantity"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        special: json["special"],
        tax: json["tax"],
        minimum: json["minimum"],
        rating: json["rating"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "quantity": quantity,
        "name": name,
        "description": description,
        "price": price,
        "special": special,
        "tax": tax,
        "minimum": minimum,
        "rating": rating,
        "href": href,
      };
}

class SellerDetail {
  SellerDetail({
    this.sellerName,
    this.storeId,
    this.sellerRating,
    this.sellerCount,
    this.sellerHref,
    this.sellerReviewLink,
    this.sellerContactLink,
    this.otherSellerCount,
  });

  String? sellerName;
  String? storeId;
  String? sellerRating;
  String? sellerCount;
  String? sellerHref;
  String? sellerReviewLink;
  String? sellerContactLink;
  int? otherSellerCount;

  factory SellerDetail.fromJson(Map<String, dynamic> json) => SellerDetail(
        sellerName: json["seller_name"],
        storeId: json["store_id"],
        sellerRating: json["seller_rating"],
        sellerCount: json["seller_count"],
        sellerHref: json["seller_href"],
        sellerReviewLink: json["seller_review_link"],
        sellerContactLink: json["seller_contact_link"],
        otherSellerCount: json["other_seller_count"],
      );

  Map<String, dynamic> toJson() => {
        "seller_name": sellerName,
        "store_id": storeId,
        "seller_rating": sellerRating,
        "seller_count": sellerCount,
        "seller_href": sellerHref,
        "seller_review_link": sellerReviewLink,
        "seller_contact_link": sellerContactLink,
        "other_seller_count": otherSellerCount,
      };
}

class SpecialSection {
  SpecialSection({
    this.image,
    this.title,
    this.description,
  });

  String? image;
  String? title;
  String? description;

  factory SpecialSection.fromJson(Map<String, dynamic> json) => SpecialSection(
        image: json["image"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description == null ? null : description,
      };
}

class Tag {
  Tag({
    this.tag,
    this.href,
  });

  String? tag;
  String? href;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tag: json["tag"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "href": href,
      };
}
