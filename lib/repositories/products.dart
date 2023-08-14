import '../models/product.dart';
import '../services/api.dart';

class ProductsRepository {
  static Future<List<Product>> findMany() async {
    List productsAsMap = await api.get("/product");

    return productsAsMap.map((p) => Product.fromMap(p)).toList();
  }

  static Future<Product> findOne(int productId) async {
    Map<String, dynamic> productAsMap = await api.get("/product/$productId");

    return Product.fromMap(productAsMap);
  }

  static Future<Product> create(String name, int stock) async {
    Map body = {"name": name, "stock": stock};
    Map<String, dynamic> productAsMap = await api.post("/product/", body);

    return Product.fromMap(productAsMap);
  }

  static Future<void> update(Product product) async {
    Map body = {"name": product.name, "stock": product.stock};
    await api.put("/product/${product.productId}", body);
  }

  static Future<void> delete(int productId) async {
    await api.delete("/product/$productId");
  }
}
