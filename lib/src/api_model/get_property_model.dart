class GetPropertyCategoryModel {
  String? status;
  String? message;
  List<CategoryList>? categoryList;

  GetPropertyCategoryModel({this.status, this.message, this.categoryList});

  GetPropertyCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categoryList'] != null) {
      categoryList = <CategoryList>[];
      json['categoryList'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.categoryList != null) {
      data['categoryList'] = this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  String? categoryId;
  String? category;
  String? timestamp;

  CategoryList({this.categoryId, this.category, this.timestamp});

  CategoryList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    category = json['category'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
