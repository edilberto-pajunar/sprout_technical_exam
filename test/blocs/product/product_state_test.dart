import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_technical_exam/bloc/product/product_bloc.dart';
import 'package:sprout_technical_exam/model/product.dart';

void main() {
  group("ProductState", () {
    test("suppports value comparisons", () {
      expect(const ProductState(), const ProductState());
    });

    test('ProductListLoaded should be equatable', () {
      final products = [
        Product.product1,
        Product.product2,
      ];

      expect(
        ProductListLoaded(products: products),
        ProductListLoaded(products: products),
      );
    });

    test('ProductLoaded should be equatable', () {
      final product1 = Product.product1;
      final product2 = Product.product2;

      expect(ProductLoaded(product: product1), ProductLoaded(product: product2));
    });
  });
}
