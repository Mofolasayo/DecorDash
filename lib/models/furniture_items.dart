class FurnitureItem {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String images;

  FurnitureItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.images,
  });

  factory FurnitureItem.fromJson(Map<String, dynamic> json) {
    return FurnitureItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'images': images,
    };
  }
}
