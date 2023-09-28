class GetMyServiceList {
  String? status;
  String? message;
  List<ServiceList>? serviceList;

  GetMyServiceList({this.status, this.message, this.serviceList});

  GetMyServiceList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['serviceList'] != null) {
      serviceList = <ServiceList>[];
      json['serviceList'].forEach((v) {
        serviceList!.add(new ServiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.serviceList != null) {
      data['serviceList'] = this.serviceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceList {
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

  ServiceList(
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
        this.isActive});

  ServiceList.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
