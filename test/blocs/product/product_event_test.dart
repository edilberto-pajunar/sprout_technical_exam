import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_technical_exam/bloc/product/product_bloc.dart';
import 'package:sprout_technical_exam/model/product.dart';

void main() {
  group('Product Event', () {
    group('Product Loaded', () {
      test("supports value equality", () {
        expect(ProductLoaded(product: Product.product1), ProductLoaded(product: Product.product1));
      });
    });

    group('Product List Loaded', () {
      final products = [Product.product1, Product.product2];
      test("supports value equality", () {
        expect(ProductListLoaded(products: products), ProductLoaded);
      });
    });
  });
}
