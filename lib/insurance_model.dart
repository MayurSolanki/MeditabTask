// To parse this JSON data, do
//
//     final insuranceModel = insuranceModelFromJson(jsonString);

import 'dart:convert';

InsuranceModel insuranceModelFromJson(String str) => InsuranceModel.fromJson(json.decode(str));

String insuranceModelToJson(InsuranceModel data) => json.encode(data.toJson());

class InsuranceModel {
  Meta meta;
  List<Datum> data;

  InsuranceModel({
    this.meta,
    this.data,
  });

  factory InsuranceModel.fromJson(Map<String, dynamic> json) => InsuranceModel(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String uid;
  String name;
  List<Plan> plans;

  Datum({
    this.uid,
    this.name,
    this.plans,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uid: json["uid"],
    name: json["name"],
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
  };
}

class Plan {
  String uid;
  String name;
  List<Category> category;

  Plan({
    this.uid,
    this.name,
    this.category,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    uid: json["uid"],
    name: json["name"],
    category: List<Category>.from(json["category"].map((x) => categoryValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "category": List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
  };
}

enum Category { MEDICAL, DENTAL, VISION }

final categoryValues = EnumValues({
  "dental": Category.DENTAL,
  "medical": Category.MEDICAL,
  "vision": Category.VISION
});

class Meta {
  String dataType;
  int total;
  int count;
  int skip;
  int limit;

  Meta({
    this.dataType,
    this.total,
    this.count,
    this.skip,
    this.limit,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    dataType: json["data_type"],
    total: json["total"],
    count: json["count"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "data_type": dataType,
    "total": total,
    "count": count,
    "skip": skip,
    "limit": limit,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
