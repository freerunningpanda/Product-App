class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        category: json['category'],
        description: json['description'],
        image: json['image']);
  }

  @override
  String toString() {
    return 'ProductID: $id || Title: $title || Price: $price';
  }
}
