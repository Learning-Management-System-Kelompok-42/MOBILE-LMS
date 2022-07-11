// class UserListModel {
//   int? code;
//   String? message;
//   List<Data>? data;

//   UserListModel({this.code, this.message, this.data});

//   UserListModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String? id;
//   String? companyId;
//   String? role;
//   String? specializationId;
//   String? fullName;
//   String? email;
//   String? phoneNumber;
//   String? address;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.companyId,
//       this.role,
//       this.specializationId,
//       this.fullName,
//       this.email,
//       this.phoneNumber,
//       this.address,
//       this.createdAt,
//       this.updatedAt});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       id: json['id'],
//       companyId: json['companyid'],
//       role: json['role'],
//       specializationId: json['specialization_id'],
//       fullName: json['full_name'],
//       email: json['email'],
//       phoneNumber: json['phone_number'],
//       address: json['address'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['company_id'] = this.companyId;
//     data['role'] = this.role;
//     data['specialization_id'] = this.specializationId;
//     data['full_name'] = this.fullName;
//     data['email'] = this.email;
//     data['phone_number'] = this.phoneNumber;
//     data['address'] = this.address;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
