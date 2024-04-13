class ProductModel {
  final String title;
  final double price;
  final String image;

  ProductModel({required this.title, required this.price, required this.image});

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toDouble(), // Convert to double if necessary
      image: json['thumbnail'],
    );
  }
}