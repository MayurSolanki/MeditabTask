

// To parse this JSON data, do
//
// final specialitiesModel = specialitiesModelFromJson(jsonString);

import 'dart:convert';

SpecialitiesModel specialitiesModelFromJson(String str) => SpecialitiesModel.fromJson(json.decode(str));

String specialitiesModelToJson(SpecialitiesModel data) => json.encode(data.toJson());

class SpecialitiesModel {
  Meta meta;
  List<Datum> data;

  SpecialitiesModel({
    this.meta,
    this.data,
  });

  factory SpecialitiesModel.fromJson(Map<String, dynamic> json) => SpecialitiesModel(
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
  String description;
  Category category;
  String actor;
  String actors;

  Datum({
    this.uid,
    this.name,
    this.description,
    this.category,
    this.actor,
    this.actors,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uid: json["uid"],
    name: json["name"],
    description: json["description"],
    category: categoryValues.map[json["category"]],
    actor: json["actor"],
    actors: json["actors"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "description": description,
    "category": categoryValues.reverse[category],
    "actor": actor,
    "actors": actors,
  };
}

enum Category { MEDICAL, VISION, DENTAL, THERAPY, SERVICES }

final categoryValues = EnumValues({
  "dental": Category.DENTAL,
  "medical": Category.MEDICAL,
  "services": Category.SERVICES,
  "therapy": Category.THERAPY,
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
