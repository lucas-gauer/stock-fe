class Product {
  Product({
    required this.productId,
    required this.name,
    required this.stock,
  });

  final int productId;
  final String name;
  final int stock;

  factory Product.fromMap(Map<String, dynamic> map) => Product(
        productId: map["product_id"],
        name: map["name"],
        stock: map["stock"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "name": name,
        "stock": stock,
      };
    
  @override
  String toString() => "$name: $stock";
}
