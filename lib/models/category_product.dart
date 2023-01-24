// To parse this JSON data, do
//
//     final categoryProduct = categoryProductFromJson(jsonString);

import 'dart:convert';

CategoryProduct categoryProductFromJson(String str) => CategoryProduct.fromJson(json.decode(str));

String categoryProductToJson(CategoryProduct data) => json.encode(data.toJson());

class CategoryProduct {
    CategoryProduct({
        this.success,
        this.data,
        this.message,
        this.code,
    });

    bool success;
    Data data;
    String message;
    int code;

    factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "code": code,
    };
}

class Data {
    Data({
        this.data,
        this.links,
        this.meta,
    });

    List<Datum> data;
    Links links;
    Meta meta;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
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
    int finalProductPrice;
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
        // discountedPrice: json["discounted_price"].toDouble(),
        // finalProductPrice: json["final_product_price"],
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

class Links {
    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    String first;
    String last;
    dynamic prev;
    dynamic next;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    int currentPage;
    int from;
    int lastPage;
    List<Link> links;
    String path;
    int perPage;
    int to;
    int total;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    Link({
        this.url,
        this.label,
        this.active,
    });

    String url;
    String label;
    bool active;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
