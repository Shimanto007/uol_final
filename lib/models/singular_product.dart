// To parse this JSON data, do
//
//     final categorySingularProduct = categorySingularProductFromJson(jsonString);

import 'dart:convert';

CategorySingularProduct categorySingularProductFromJson(String str) => CategorySingularProduct.fromJson(json.decode(str));

String categorySingularProductToJson(CategorySingularProduct data) => json.encode(data.toJson());

class CategorySingularProduct {
    CategorySingularProduct({
        this.product,
    });

    List<Product> product;

    factory CategorySingularProduct.fromJson(Map<String, dynamic> json) => CategorySingularProduct(
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.sectionId,
        this.categoryId,
        this.brandId,
        this.productCollectionId,
        this.adminId,
        this.adminType,
        this.productName,
        this.productCode,
        this.productImage,
        this.shortDescription,
        this.description,
        this.productPrice,
        this.finalProductPrice,
        this.productDiscount,
        this.productQty,
        this.productWeight,
        this.productVideo,
        this.productColor,
        this.productSize,
        this.productTags,
        this.attributes,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.isPopular,
        this.isFeatured,
        this.isBestseller,
        this.isDealsday,
        this.status,
        this.stock,
        this.productSlug,
        this.taxId,
        this.createdAt,
        this.updatedAt,
        this.images,
        this.section,
        this.category,
        // this.productcollection,
        this.tax,
    });

    int id;
    int sectionId;
    int categoryId;
    int brandId;
    int productCollectionId;
    int adminId;
    String adminType;
    String productName;
    String productCode;
    ProductImage productImage;
    dynamic shortDescription;
    String description;
    int productPrice;
    dynamic finalProductPrice;
    int productDiscount;
    dynamic productQty;
    String productWeight;
    dynamic productVideo;
    dynamic productColor;
    dynamic productSize;
    dynamic productTags;
    dynamic attributes;
    String metaTitle;
    String metaDescription;
    String metaKeywords;
    String isPopular;
    String isFeatured;
    String isBestseller;
    String isDealsday;
    int status;
    int stock;
    String productSlug;
    int taxId;
    String createdAt;
    String updatedAt;
    List<dynamic> images;
    Section section;
    Category category;
    // Productcollection productcollection;
    dynamic tax;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sectionId: json["section_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        productCollectionId: json["product_collection_id"],
        adminId: json["admin_id"],
        adminType: json["admin_type"],
        productName: json["product_name"],
        productCode: json["product_code"],
        productImage: ProductImage.fromJson(json["product_image"]),
        shortDescription: json["short_description"],
        description: json["description"],
        productPrice: json["product_price"],
        finalProductPrice: json["final_product_price"],
        productDiscount: json["product_discount"],
        productQty: json["product_qty"],
        productWeight: json["product_weight"],
        productVideo: json["product_video"],
        productColor: json["product_color"],
        productSize: json["product_size"],
        productTags: json["product_tags"],
        attributes: json["attributes"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        isPopular: json["is_popular"],
        isFeatured: json["is_featured"],
        isBestseller: json["is_bestseller"],
        isDealsday: json["is_dealsday"],
        status: json["status"],
        stock: json["stock"],
        productSlug: json["product_slug"],
        taxId: json["tax_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        section: Section.fromJson(json["section"]),
        category: Category.fromJson(json["category"]),
        // productcollection: Productcollection.fromJson(json["productcollection"]),
        tax: json["tax"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "section_id": sectionId,
        "category_id": categoryId,
        "brand_id": brandId,
        "product_collection_id": productCollectionId,
        "admin_id": adminId,
        "admin_type": adminType,
        "product_name": productName,
        "product_code": productCode,
        "product_image": productImage.toJson(),
        "short_description": shortDescription,
        "description": description,
        "product_price": productPrice,
        "final_product_price": finalProductPrice,
        "product_discount": productDiscount,
        "product_qty": productQty,
        "product_weight": productWeight,
        "product_video": productVideo,
        "product_color": productColor,
        "product_size": productSize,
        "product_tags": productTags,
        "attributes": attributes,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "is_popular": isPopular,
        "is_featured": isFeatured,
        "is_bestseller": isBestseller,
        "is_dealsday": isDealsday,
        "status": status,
        "stock": stock,
        "product_slug": productSlug,
        "tax_id": taxId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "images": List<dynamic>.from(images.map((x) => x)),
        "section": section.toJson(),
        "category": category.toJson(),
        // "productcollection": productcollection.toJson(),
        "tax": tax,
    };
}

class Category {
    Category({
        this.id,
        this.categoryName,
    });

    int id;
    String categoryName;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
    };
}

class ProductImage {
    ProductImage({
        this.large,
        this.medium,
        this.small,
    });

    String large;
    String medium;
    String small;

    factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
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

// class Productcollection {
//     Productcollection({
//         this.id,
//         this.name,
//         this.discountType,
//         this.discountAmount,
//         this.startDate,
//         this.endDate,
//         this.status,
//     });
//
//     int id;
//     String name;
//     String discountType;
//     String discountAmount;
//     String startDate;
//     String endDate;
//     int status;
//
//     factory Productcollection.fromJson(Map<String, dynamic> json) => Productcollection(
//         id: json["id"],
//         name: json["name"],
//         discountType: json["discount_type"],
//         discountAmount: json["discount_amount"],
//         startDate: json["start_date"],
//         endDate: json["end_date"],
//         status: json["status"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "discount_type": discountType,
//         "discount_amount": discountAmount,
//         "start_date": startDate,
//         "end_date": endDate,
//         "status": status,
//     };
// }

class Section {
    Section({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
