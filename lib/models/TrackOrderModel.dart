import 'History.dart';

class TrackOrderModel {
  TrackOrderModel({
      this.orderId,
      this.orderAdded,
      this.history,
      this.name,
      this.courier,
      this.trakingNum,
      this.journey,});

  TrackOrderModel.fromJson(dynamic json) {
    orderId = json['OrderId'].toString() ?? "";
    orderAdded = json['order_added'];
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
    name = json['name'];
    courier = json['courier'];
    trakingNum = json['traking_num'];
    if (json['journey'] != null) {
      journey = [];
      json['journey'].forEach((v) {
        //journey.add(Dynamic.fromJson(v));
      });
    }
  }
  String? orderId;
  String? orderAdded;
  List<History>? history;
  String? name;
  String? courier;
  String? trakingNum;
  List<dynamic>? journey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderId'] = orderId;
    map['order_added'] = orderAdded;
    if (history != null) {
      map['history'] = history!.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['courier'] = courier;
    map['traking_num'] = trakingNum;
    if (journey != null) {
      //map['journey'] = journey.map((v) => v.toJson()).toList();
    }
    return map;
  }

}