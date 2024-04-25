import 'package:sprout_technical_exam/model/product.dart';

abstract class BaseProductRepository {
  Future<List<Product>> getProducts(String skip);
  Future<Product> getProduct(String id);
}
