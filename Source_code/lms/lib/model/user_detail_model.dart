class UserDetailModel {
  UserDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final Data data;

  UserDetailModel.fromJson(Map<String, dynamic> json) {
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
    this.id,
    this.companyId,
    this.specializationName,
    this.specializationId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
    this.levelAccess,
    this.createdAt,
    this.updatedAt,
  });
  String? id;
  String? companyId;
  String? specializationName;
  String? specializationId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  String? levelAccess;
  String? createdAt;
  String? updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    specializationName = json['specialization_name'];
    specializationId = json['specialization_id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    levelAccess = json['level_access'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['specialization_name'] = specializationName;
    _data['specialization_id'] = specializationId;
    _data['full_name'] = fullName;
    _data['email'] = email;
    _data['phone_number'] = phoneNumber;
    _data['address'] = address;
    _data['level_access'] = levelAccess;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
