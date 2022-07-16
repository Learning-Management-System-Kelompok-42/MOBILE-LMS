class ModulModel {
  ModulModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final List<Data> data;

  ModulModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = List.from(json['data'] ?? {}).map((e) => Data.fromJson(e)).toList();
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
    required this.ID,
    required this.CourseID,
    required this.YoutubeURL,
    required this.SlideURL,
    required this.Title,
    required this.Orders,
    required this.CreatedAt,
    required this.UpdatedAt,
  });
  late final String ID;
  late final String CourseID;
  late final String YoutubeURL;
  late final String SlideURL;
  late final String Title;
  late final int Orders;
  late final String CreatedAt;
  late final String UpdatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    CourseID = json['CourseID'];
    YoutubeURL = json['YoutubeURL'];
    SlideURL = json['SlideURL'];
    Title = json['Title'];
    Orders = json['Orders'];
    CreatedAt = json['CreatedAt'];
    UpdatedAt = json['UpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['CourseID'] = CourseID;
    _data['YoutubeURL'] = YoutubeURL;
    _data['SlideURL'] = SlideURL;
    _data['Title'] = Title;
    _data['Orders'] = Orders;
    _data['CreatedAt'] = CreatedAt;
    _data['UpdatedAt'] = UpdatedAt;
    return _data;
  }
}
