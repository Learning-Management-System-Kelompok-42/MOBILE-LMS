class CourseModel {
  CourseModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final List<Data> data;

  CourseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.progress,
    required this.score,
  });
  late final String id;
  late final String title;
  late final String thumbnail;
  late final String description;
  late final int progress;
  late final int score;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    progress = json['progress'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['thumbnail'] = thumbnail;
    _data['description'] = description;
    _data['progress'] = progress;
    _data['score'] = score;
    return _data;
  }
}
