// To parse this JSON data, do
//
//     final listAddressModel = listAddressModelFromJson(jsonString);

import 'dart:convert';

Map<String, ListAddressModel> listAddressModelFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, ListAddressModel>(k, ListAddressModel.fromJson(v)));

dynamic listAddressModelToJson(Map<String, ListAddressModel> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ListAddressModel {
  ListAddressModel({
    this.addressId,
    this.firstname,
    this.lastname,
    this.company,
    this.telephone,
    this.address1,
    this.address2,
    this.postcode,
    this.city,
    this.zoneId,
    this.zone,
    this.zoneCode,
    this.countryId,
    this.country,
    this.isoCode2,
    this.isoCode3,
    this.addressFormat,
    this.customField,
  });

  String? addressId;
  String? firstname;
  String? lastname;
  String? company;
  String? telephone;
  String? address1;
  String? address2;
  String? postcode;
  String? city;
  String? zoneId;
  String? zone;
  String? zoneCode;
  String? countryId;
  String? country;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  dynamic customField;

  factory ListAddressModel.fromJson(Map<String, dynamic> json) => ListAddressModel(
    addressId: json["address_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    company: json["company"],
    telephone: json["telephone"],
    address1: json["address_1"],
    address2: json["address_2"],
    postcode: json["postcode"],
    city: json["city"],
    zoneId: json["zone_id"],
    zone: json["zone"],
    zoneCode: json["zone_code"],
    countryId: json["country_id"],
    country: json["country"],
    isoCode2: json["iso_code_2"],
    isoCode3: json["iso_code_3"],
    addressFormat: json["address_format"],
    customField: json["custom_field"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "firstname": firstname,
    "lastname": lastname,
    "company": company,
    "telephone": telephone,
    "address_1": address1,
    "address_2": address2,
    "postcode": postcode,
    "city": city,
    "zone_id": zoneId,
    "zone": zone,
    "zone_code": zoneCode,
    "country_id": countryId,
    "country": country,
    "iso_code_2": isoCode2,
    "iso_code_3": isoCode3,
    "address_format": addressFormat,
    "custom_field": customField,
  };
}
