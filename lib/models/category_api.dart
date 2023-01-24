// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel({
        this.categories,
    });

    List<CategoryModelCategory> categories;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: List<CategoryModelCategory>.from(json["categories"].map((x) => CategoryModelCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class CategoryModelCategory {
    CategoryModelCategory({
        this.id,
        this.name,
        this.categories,
    });

    int id;
    String name;
    List<CategoryCategory> categories;

    factory CategoryModelCategory.fromJson(Map<String, dynamic> json) => CategoryModelCategory(
        id: json["id"],
        name: json["name"],
        categories: List<CategoryCategory>.from(json["categories"].map((x) => CategoryCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class CategoryCategory {
    CategoryCategory({
        this.id,
        this.sectionId,
        this.categoryName,
        this.categoryImage,
        this.categoryDiscount,
        this.url,
        this.categoryBgColor,
    });

    int id;
    int sectionId;
    String categoryName;
    String categoryImage;
    int categoryDiscount;
    String url;
    dynamic categoryBgColor;

    factory CategoryCategory.fromJson(Map<String, dynamic> json) => CategoryCategory(
        id: json["id"],
        sectionId: json["section_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryDiscount: json["category_discount"],
        url: json["url"],
        categoryBgColor: json["category_bg_color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "section_id": sectionId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_discount": categoryDiscount,
        "url": url,
        "category_bg_color": categoryBgColor,
    };
}


