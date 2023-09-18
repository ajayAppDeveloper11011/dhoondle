class ServiceDetailModel {
  String? status;
  String? message;
  List<Data>? data;

  ServiceDetailModel({this.status, this.message, this.data});

  ServiceDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? service;
  String? userId;
  String? timestamp;
  UserDetails? userDetails;

  Data({this.id, this.service, this.userId, this.timestamp, this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    userId = json['user_id'];
    timestamp = json['timestamp'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service'] = this.service;
    data['user_id'] = this.userId;
    data['timestamp'] = this.timestamp;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? userId;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? otp;
  String? image;
  String? deviceToken;
  String? latitude;
  String? longitude;

  UserDetails(
      {this.userId,
        this.name,
        this.mobile,
        this.email,
        this.address,
        this.otp,
        this.image,
        this.deviceToken,
        this.latitude,
        this.longitude});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    otp = json['otp'];
    image = json['image'];
    deviceToken = json['device_token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['otp'] = this.otp;
    data['image'] = this.image;
    data['device_token'] = this.deviceToken;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
