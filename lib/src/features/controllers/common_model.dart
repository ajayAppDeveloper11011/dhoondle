import 'dart:convert';

class CommonModel {
  String status;
  String message;

  CommonModel({
    required this.status,
    required this.message,
  });

  factory CommonModel.fromRawJson(String str) => CommonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
