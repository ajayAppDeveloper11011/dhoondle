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
  String? userId;
  String? service;
  String? amount;
  String? timestamp;
  String? number;
  String? description;
  String? address;
  String? serviceId;
  String? image;
  String? isActive;
  List<ServiceImages>? serviceImages;
  String? rating;
  UserDetails? userDetails;

  Data(
      {this.id,
        this.userId,
        this.service,
        this.amount,
        this.timestamp,
        this.number,
        this.description,
        this.address,
        this.serviceId,
        this.image,
        this.isActive,
        this.serviceImages,
        this.rating,
        this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    service = json['service'];
    amount = json['amount'];
    timestamp = json['timestamp'];
    number = json['number'];
    description = json['description'];
    address = json['address'];
    serviceId = json['service_id'];
    image = json['image'];
    isActive = json['isActive'];
    if (json['serviceImages'] != null) {
      serviceImages = <ServiceImages>[];
      json['serviceImages'].forEach((v) {
        serviceImages!.add(new ServiceImages.fromJson(v));
      });
    }
    rating = json['rating'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service'] = this.service;
    data['amount'] = this.amount;
    data['timestamp'] = this.timestamp;
    data['number'] = this.number;
    data['description'] = this.description;
    data['address'] = this.address;
    data['service_id'] = this.serviceId;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    if (this.serviceImages != null) {
      data['serviceImages'] =
          this.serviceImages!.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class ServiceImages {
  String? id;
  String? userId;
  String? sId;
  String? image;
  String? timestamp;

  ServiceImages({this.id, this.userId, this.sId, this.image, this.timestamp});

  ServiceImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sId = json['s_id'];
    image = json['image'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['s_id'] = this.sId;
    data['image'] = this.image;
    data['timestamp'] = this.timestamp;
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
