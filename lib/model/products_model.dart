class ProductsModel {
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    this.isFavourite = false,
  });

  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? images;
  bool isFavourite;

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        images: json["image"],
        isFavourite: false);
  }
}
