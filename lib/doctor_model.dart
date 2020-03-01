// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';


DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());


class DoctorModel {
  Meta meta;
  List<Datum> data;

  DoctorModel({
    this.meta,
    this.data,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };



}

class Datum {
  List<Practice> practices;
  List<Education> educations;
  Profile profile;
  List<Rating> ratings;
  List<Insurance> insurances;
  List<Specialty> specialties;
  List<License> licenses;
  String uid;
  String npi;

  Datum({
    this.practices,
    this.educations,
    this.profile,
    this.ratings,
    this.insurances,
    this.specialties,
    this.licenses,
    this.uid,
    this.npi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    practices: List<Practice>.from(json["practices"].map((x) => Practice.fromJson(x))),
    educations: List<Education>.from(json["educations"].map((x) => Education.fromJson(x))),
    profile: Profile.fromJson(json["profile"]),
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    insurances: List<Insurance>.from(json["insurances"].map((x) => Insurance.fromJson(x))),
    specialties: List<Specialty>.from(json["specialties"].map((x) => Specialty.fromJson(x))),
    licenses: List<License>.from(json["licenses"].map((x) => License.fromJson(x))),
    uid: json["uid"],
    npi: json["npi"],
  );

  Map<String, dynamic> toJson() => {
    "practices": List<dynamic>.from(practices.map((x) => x.toJson())),
    "educations": List<dynamic>.from(educations.map((x) => x.toJson())),
    "profile": profile.toJson(),
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "insurances": List<dynamic>.from(insurances.map((x) => x.toJson())),
    "specialties": List<dynamic>.from(specialties.map((x) => x.toJson())),
    "licenses": List<dynamic>.from(licenses.map((x) => x.toJson())),
    "uid": uid,
    "npi": npi,
  };
}

class Meta {
  String dataType;
  String itemType;
  int total;
  int count;
  int skip;
  int limit;

  Meta({
    this.dataType,
    this.itemType,
    this.total,
    this.count,
    this.skip,
    this.limit,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    dataType: json["data_type"],
    itemType: json["item_type"],
    total: json["total"],
    count: json["count"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "data_type": dataType,
    "item_type": itemType,
    "total": total,
    "count": count,
    "skip": skip,
    "limit": limit,
  };
}



class Education {
  String school;
  String degree;
  String graduationYear;

  Education({
    this.school,
    this.degree,
    this.graduationYear,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    school: json["school"],
    degree: json["degree"] == null ? null : json["degree"],
    graduationYear: json["graduation_year"] == null ? null : json["graduation_year"],
  );

  Map<String, dynamic> toJson() => {
    "school": school,
    "degree": degree == null ? null : degree,
    "graduation_year": graduationYear == null ? null : graduationYear,
  };
}

class Insurance {
  InsurancePlan insurancePlan;
  InsuranceProvider insuranceProvider;

  Insurance({
    this.insurancePlan,
    this.insuranceProvider,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
    insurancePlan: InsurancePlan.fromJson(json["insurance_plan"]),
    insuranceProvider: InsuranceProvider.fromJson(json["insurance_provider"]),
  );

  Map<String, dynamic> toJson() => {
    "insurance_plan": insurancePlan.toJson(),
    "insurance_provider": insuranceProvider.toJson(),
  };
}

class InsurancePlan {
  String uid;
  String name;
  List<Category> category;
  List<dynamic> programTypes;

  InsurancePlan({
    this.uid,
    this.name,
    this.category,
    this.programTypes,
  });

  factory InsurancePlan.fromJson(Map<String, dynamic> json) => InsurancePlan(
    uid: json["uid"],
    name: json["name"],
    category: List<Category>.from(json["category"].map((x) => categoryValues.map[x])),
    programTypes: List<dynamic>.from(json["program_types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "category": List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
    "program_types": List<dynamic>.from(programTypes.map((x) => x)),
  };
}

enum Category { MEDICAL, VISION, DENTAL }

final categoryValues = EnumValues({
  "dental": Category.DENTAL,
  "medical": Category.MEDICAL,
  "vision": Category.VISION
});

class InsuranceProvider {
  Uid uid;
  InsuranceProviderName name;

  InsuranceProvider({
    this.uid,
    this.name,
  });

  factory InsuranceProvider.fromJson(Map<String, dynamic> json) => InsuranceProvider(
    uid: uidValues.map[json["uid"]],
    name: insuranceProviderNameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "uid": uidValues.reverse[uid],
    "name": insuranceProviderNameValues.reverse[name],
  };
}

enum InsuranceProviderName { BCBS, HEALTH_NET, CIGNA, VSP, MEDICARE, MEDICAID, AETNA, NAME_HEALTH_NET, KAISER_PERMANENTE, MULTIPLAN, UNITED_HEALTHCARE, DELTA_DENTAL, PRINCIPAL_FINANCIAL_SERVICES, WESTERN_HEALTH_ADVANTAGE, ASSURANT, DENTAL_NETWORK_OF_AMERICA, UNITED_CONCORDIA, CAMBIA_HEALTH_SOLUTIONS, LA_CARE_HEALTH }

final insuranceProviderNameValues = EnumValues({
  "Aetna": InsuranceProviderName.AETNA,
  "Assurant": InsuranceProviderName.ASSURANT,
  "BCBS": InsuranceProviderName.BCBS,
  "Cambia Health Solutions": InsuranceProviderName.CAMBIA_HEALTH_SOLUTIONS,
  "Cigna": InsuranceProviderName.CIGNA,
  "Delta Dental": InsuranceProviderName.DELTA_DENTAL,
  "Dental Network of America": InsuranceProviderName.DENTAL_NETWORK_OF_AMERICA,
  "HealthNet": InsuranceProviderName.HEALTH_NET,
  "Kaiser Permanente": InsuranceProviderName.KAISER_PERMANENTE,
  "LA Care Health": InsuranceProviderName.LA_CARE_HEALTH,
  "Medicaid": InsuranceProviderName.MEDICAID,
  "Medicare": InsuranceProviderName.MEDICARE,
  "Multiplan": InsuranceProviderName.MULTIPLAN,
  "Health Net": InsuranceProviderName.NAME_HEALTH_NET,
  "Principal Financial Services": InsuranceProviderName.PRINCIPAL_FINANCIAL_SERVICES,
  "United Concordia": InsuranceProviderName.UNITED_CONCORDIA,
  "United Healthcare": InsuranceProviderName.UNITED_HEALTHCARE,
  "VSP": InsuranceProviderName.VSP,
  "Western Health Advantage": InsuranceProviderName.WESTERN_HEALTH_ADVANTAGE
});

enum Uid { BLUESHIELDOFCALIFORNIA, HEALTHNET, ANTHEMBLUECROSS, CIGNA, VSP, MEDICARE, MEDICAID, AETNA, ANTHEMBLUECROSSBLUESHIELD, KAISERPERMANENTE, BCBS, PREMERABLUECROSSBLUESHIELD, MULTIPLAN, UNITEDHEALTHCARE, DELTADENTAL, PRINCIPALFINANCIALSERVICES, WESTERNHEALTHADVANTAGE, ASSURANT, DENTALNETWORKOFAMERICA, UNITEDCONCORDIA, BRIDGESPAN, LACAREHEALTH, IBCAMERIHEALTH }

final uidValues = EnumValues({
  "aetna": Uid.AETNA,
  "anthembluecross": Uid.ANTHEMBLUECROSS,
  "anthembluecrossblueshield": Uid.ANTHEMBLUECROSSBLUESHIELD,
  "assurant": Uid.ASSURANT,
  "bcbs": Uid.BCBS,
  "blueshieldofcalifornia": Uid.BLUESHIELDOFCALIFORNIA,
  "bridgespan": Uid.BRIDGESPAN,
  "cigna": Uid.CIGNA,
  "deltadental": Uid.DELTADENTAL,
  "dentalnetworkofamerica": Uid.DENTALNETWORKOFAMERICA,
  "healthnet": Uid.HEALTHNET,
  "ibcamerihealth": Uid.IBCAMERIHEALTH,
  "kaiserpermanente": Uid.KAISERPERMANENTE,
  "lacarehealth": Uid.LACAREHEALTH,
  "medicaid": Uid.MEDICAID,
  "medicare": Uid.MEDICARE,
  "multiplan": Uid.MULTIPLAN,
  "premerabluecrossblueshield": Uid.PREMERABLUECROSSBLUESHIELD,
  "principalfinancialservices": Uid.PRINCIPALFINANCIALSERVICES,
  "unitedconcordia": Uid.UNITEDCONCORDIA,
  "unitedhealthcare": Uid.UNITEDHEALTHCARE,
  "vsp": Uid.VSP,
  "westernhealthadvantage": Uid.WESTERNHEALTHADVANTAGE
});

class License {
  String number;
  DateTime endDate;

  License({
    this.number,
    this.endDate,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
    number: json["number"] == null ? null : json["number"],
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number == null ? null : number,
    "end_date": endDate == null ? null : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
  };
}


class Practice {
  String locationSlug;
  bool withinSearchArea;
  double distance;
  double lat;
  double lon;
  String uid;
  String name;
  String website;
  bool acceptsNewPatients;
  List<String> insuranceUids;
  List<Insurance> insurances;
  VisitAddress visitAddress;
  List<dynamic> officeHours;
  List<Phone> phones;
  List<Language> languages;
  List<Media> media;
  String description;
  List<String> imageUrls;

  Practice({
    this.locationSlug,
    this.withinSearchArea,
    this.distance,
    this.lat,
    this.lon,
    this.uid,
    this.name,
    this.website,
    this.acceptsNewPatients,
    this.insuranceUids,
    this.insurances,
    this.visitAddress,
    this.officeHours,
    this.phones,
    this.languages,
    this.media,
    this.description,
    this.imageUrls,
  });

  factory Practice.fromJson(Map<String, dynamic> json) => Practice(
    locationSlug: json["location_slug"],
    withinSearchArea: json["within_search_area"],
    distance: json["distance"].toDouble(),
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    uid: json["uid"],
    name: json["name"],
    website: json["website"] == null ? null : json["website"],
    acceptsNewPatients: json["accepts_new_patients"],
    insuranceUids: List<String>.from(json["insurance_uids"].map((x) => x)),
    insurances: List<Insurance>.from(json["insurances"].map((x) => Insurance.fromJson(x))),
    visitAddress: VisitAddress.fromJson(json["visit_address"]),
    officeHours: List<dynamic>.from(json["office_hours"].map((x) => x)),
    phones: List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    media: json["media"] == null ? null : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    description: json["description"] == null ? null : json["description"],
    imageUrls: json["image_urls"] == null ? null : List<String>.from(json["image_urls"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "location_slug": locationSlug,
    "within_search_area": withinSearchArea,
    "distance": distance,
    "lat": lat,
    "lon": lon,
    "uid": uid,
    "name": name,
    "website": website == null ? null : website,
    "accepts_new_patients": acceptsNewPatients,
    "insurance_uids": List<dynamic>.from(insuranceUids.map((x) => x)),
    "insurances": List<dynamic>.from(insurances.map((x) => x.toJson())),
    "visit_address": visitAddress.toJson(),
    "office_hours": List<dynamic>.from(officeHours.map((x) => x)),
    "phones": List<dynamic>.from(phones.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "media": media == null ? null : List<dynamic>.from(media.map((x) => x.toJson())),
    "description": description == null ? null : description,
    "image_urls": imageUrls == null ? null : List<dynamic>.from(imageUrls.map((x) => x)),
  };
}

class Language {
  LanguageName name;
  Code code;

  Language({
    this.name,
    this.code,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    name: languageNameValues.map[json["name"]],
    code: codeValues.map[json["code"]],
  );

  Map<String, dynamic> toJson() => {
    "name": languageNameValues.reverse[name],
    "code": codeValues.reverse[code],
  };
}

enum Code { EN }

final codeValues = EnumValues({
  "en": Code.EN
});

enum LanguageName { ENGLISH }

final languageNameValues = EnumValues({
  "English": LanguageName.ENGLISH
});

class Media {
  String uid;
  String status;
  String url;
  List<String> tags;
  Versions versions;

  Media({
    this.uid,
    this.status,
    this.url,
    this.tags,
    this.versions,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    uid: json["uid"],
    status: json["status"],
    url: json["url"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    versions: Versions.fromJson(json["versions"]),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "status": status,
    "url": url,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "versions": versions.toJson(),
  };
}

class Versions {
  String small;
  String medium;
  String large;
  String hero;

  Versions({
    this.small,
    this.medium,
    this.large,
    this.hero,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
    hero: json["hero"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
    "hero": hero,
  };
}

class Phone {
  String number;
  Type type;

  Phone({
    this.number,
    this.type,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
    number: json["number"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "type": typeValues.reverse[type],
  };
}

enum Type { LANDLINE, FAX }

final typeValues = EnumValues({
  "fax": Type.FAX,
  "landline": Type.LANDLINE
});

class VisitAddress {
  String city;
  double lat;
  double lon;
  StateLong stateLong;
  String street;
  String zip;
  String street2;

  VisitAddress({
    this.city,
    this.lat,
    this.lon,
    this.stateLong,
    this.street,
    this.zip,
    this.street2,
  });

  factory VisitAddress.fromJson(Map<String, dynamic> json) => VisitAddress(
    city: json["city"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    stateLong: stateLongValues.map[json["state_long"]],
    street: json["street"],
    zip: json["zip"],
    street2: json["street2"] == null ? null : json["street2"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "lat": lat,
    "lon": lon,
    "state_long": stateLongValues.reverse[stateLong],
    "street": street,
    "zip": zip,
    "street2": street2 == null ? null : street2,
  };
}

enum StateLong { CALIFORNIA }

final stateLongValues = EnumValues({
  "California": StateLong.CALIFORNIA
});

class Profile {
  String firstName;
  String middleName;
  String lastName;
  String slug;
  Title title;
  String imageUrl;
  String gender;
  List<Language> languages;
  String bio;

  Profile({
    this.firstName,
    this.middleName,
    this.lastName,
    this.slug,
    this.title,
    this.imageUrl,
    this.gender,
    this.languages,
    this.bio,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    firstName: json["first_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    lastName: json["last_name"],
    slug: json["slug"],
    title: titleValues.map[json["title"]],
    imageUrl: json["image_url"],
    gender: json["gender"] == null ? null : json["gender"],
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "middle_name": middleName == null ? null : middleName,
    "last_name": lastName,
    "slug": slug,
    "title": titleValues.reverse[title],
    "image_url": imageUrl,
    "gender": gender == null ? null : gender,
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "bio": bio,
  };
}

enum Title { MD, DDS }

final titleValues = EnumValues({
  "DDS": Title.DDS,
  "MD": Title.MD
});

class Rating {
  bool active;
  String provider;
  String providerUid;
  String providerUrl;
  double rating;
  int reviewCount;
  String imageUrlSmall;
  String imageUrlSmall2X;
  String imageUrlLarge;
  String imageUrlLarge2X;

  Rating({
    this.active,
    this.provider,
    this.providerUid,
    this.providerUrl,
    this.rating,
    this.reviewCount,
    this.imageUrlSmall,
    this.imageUrlSmall2X,
    this.imageUrlLarge,
    this.imageUrlLarge2X,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    active: json["active"],
    provider: json["provider"],
    providerUid: json["provider_uid"],
    providerUrl: json["provider_url"] == null ? null : json["provider_url"],
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    reviewCount: json["review_count"] == null ? null : json["review_count"],
    imageUrlSmall: json["image_url_small"] == null ? null : json["image_url_small"],
    imageUrlSmall2X: json["image_url_small_2x"] == null ? null : json["image_url_small_2x"],
    imageUrlLarge: json["image_url_large"] == null ? null : json["image_url_large"],
    imageUrlLarge2X: json["image_url_large_2x"] == null ? null : json["image_url_large_2x"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "provider": provider,
    "provider_uid": providerUid,
    "provider_url": providerUrl == null ? null : providerUrl,
    "rating": rating == null ? null : rating,
    "review_count": reviewCount == null ? null : reviewCount,
    "image_url_small": imageUrlSmall == null ? null : imageUrlSmall,
    "image_url_small_2x": imageUrlSmall2X == null ? null : imageUrlSmall2X,
    "image_url_large": imageUrlLarge == null ? null : imageUrlLarge,
    "image_url_large_2x": imageUrlLarge2X == null ? null : imageUrlLarge2X,
  };
}

class Specialty {
  String uid;
  String name;
  String description;
  Category category;
  String actor;
  String actors;

  Specialty({
    this.uid,
    this.name,
    this.description,
    this.category,
    this.actor,
    this.actors,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
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
