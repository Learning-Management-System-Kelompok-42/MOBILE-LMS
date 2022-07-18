class CourseDetailModel {
  CourseDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final Data data;

  CourseDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.countModules,
    required this.countEmployee,
    required this.modules,
    required this.ratingReviews,
  });
  late final String id;
  late final String title;
  late final String thumbnail;
  late final String description;
  late final int countModules;
  late final int countEmployee;
  late final List<Modules> modules;
  late final List<RatingReviews> ratingReviews;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    countModules = json['count_modules'];
    countEmployee = json['count_employee'];
    modules = List.from(json['modules'] ?? {})
        .map((e) => Modules.fromJson(e))
        .toList();
    ratingReviews = List.from(json['rating_reviews'] ?? {})
        .map((e) => RatingReviews.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['thumbnail'] = thumbnail;
    _data['description'] = description;
    _data['count_modules'] = countModules;
    _data['count_employee'] = countEmployee;
    _data['modules'] = modules.map((e) => e.toJson()).toList();
    _data['rating_reviews'] = ratingReviews.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Modules {
  Modules({
    required this.ID,
    required this.Title,
    required this.Orders,
    required this.CreatedAt,
    required this.UpdatedAt,
  });
  late final String ID;
  late final String Title;
  late final int Orders;
  late final String CreatedAt;
  late final String UpdatedAt;

  Modules.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Title = json['Title'];
    Orders = json['Orders'];
    CreatedAt = json['CreatedAt'];
    UpdatedAt = json['UpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Title'] = Title;
    _data['Orders'] = Orders;
    _data['CreatedAt'] = CreatedAt;
    _data['UpdatedAt'] = UpdatedAt;
    return _data;
  }
}

class RatingReviews {
  RatingReviews({
    required this.id,
    required this.name,
    required this.email,
    required this.rating,
    required this.reviews,
  });
  late final String id;
  late final String name;
  late final String email;
  late final dynamic rating;
  late final String reviews;

  RatingReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    rating = json['rating'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['rating'] = rating;
    _data['reviews'] = reviews;
    return _data;
  }
}
