// To parse this JSON data, do
//
//     final popularProducts = popularProductsFromJson(jsonString);

import 'dart:convert';

PopularProducts popularProductsFromJson(String str) => PopularProducts.fromJson(json.decode(str));

String popularProductsToJson(PopularProducts data) => json.encode(data.toJson());

class PopularProducts {
    PopularProducts({
        this.success,
        this.data,
        this.message,
        this.code,
    });

    bool success;
    List<Datum> data;
    String message;
    int code;

    factory PopularProducts.fromJson(Map<String, dynamic> json) => PopularProducts(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.slug,
        this.regularPrice,
        this.formattedRegularPrice,
        this.discount,
        this.discountedPrice,
        this.finalProductPrice,
        this.formattedFinalProductPrice,
        this.image,
        this.links,
    });

    int id;
    String name;
    String slug;
    int regularPrice;
    String formattedRegularPrice;
    int discount;
    int discountedPrice;
    double finalProductPrice;
    String formattedFinalProductPrice;
    Image image;
    dynamic links;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        regularPrice: json["regular_price"],
        formattedRegularPrice: json["formatted_regular_price"],
        discount: json["discount"],
        discountedPrice: json["discounted_price"],
        finalProductPrice: json["final_product_price"].toDouble(),
        formattedFinalProductPrice: json["formatted_final_product_price"],
        image: Image.fromJson(json["image"]),
        links: json["links"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "regular_price": regularPrice,
        "formatted_regular_price": formattedRegularPrice,
        "discount": discount,
        "discounted_price": discountedPrice,
        "final_product_price": finalProductPrice,
        "formatted_final_product_price": formattedFinalProductPrice,
        "image": image.toJson(),
        "links": links,
    };
}

class Image {
    Image({
        this.large,
        this.medium,
        this.small,
    });

    String large;
    String medium;
    String small;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "small": small,
    };
}
