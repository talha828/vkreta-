// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    this.reviewTotal,
    this.limit,
    this.reviews,
  });

  String? reviewTotal;
  String? limit;
  List<Review>? reviews;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    reviewTotal: json["review_total"],
    limit: json["limit"],
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "review_total": reviewTotal,
    "limit": limit,
    "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    this.author,
    this.text,
    this.rating,
    this.dateAdded,
  });

  String? author;
  String? text;
  int? rating;
  String? dateAdded;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    author: json["author"],
    text: json["text"],
    rating: json["rating"],
    dateAdded: json["date_added"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "text": text,
    "rating": rating,
    "date_added": dateAdded,
  };
}
