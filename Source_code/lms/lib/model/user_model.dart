class UserModel {
  int? code;
  String? message;
  Data? data;

  UserModel({this.code, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? companyId;
  String? role;
  String? specializationId;
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? address;
  String? levelAccess;
  String? createdAt;
  String? updatedAt;

  Data(
      {required this.id,
      required this.companyId,
      required this.role,
      required this.specializationId,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.address,
      required this.levelAccess,
      required this.createdAt,
      required this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    role = json['role'];
    specializationId = json['specialization_id'];
    fullName = json['full_name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    levelAccess = json['level_access'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['role'] = this.role;
    data['specialization_id'] = this.specializationId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['level_access'] = this.levelAccess;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
