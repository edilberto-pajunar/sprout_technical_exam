import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sprout_technical_exam/bloc/product/product_bloc.dart';
import 'package:sprout_technical_exam/model/product.dart';
import 'package:sprout_technical_exam/repository/product/product_repository.dart';

import 'product_bloc_test.mocks.dart';

@GenerateMocks([
  ProductRepository,
])
void main() {
  late MockProductRepository mockProductRepository;
  late ProductBloc productBloc;

  setUp(() {
    mockProductRepository = MockProductRepository();
    productBloc = ProductBloc(productRepository: mockProductRepository);
  });
  group("ProductBloc", () {
    test("initial state should be empty", () {
      expect(productBloc.state, ProductLoading());
    });

    blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading, ProductListLoaded] when get product list is successful.',
      build: () {
        when(mockProductRepository.getProducts("1")).thenAnswer((_) async => [Product.product1]);

        return productBloc;
      },
      act: (bloc) => bloc.add(const LoadProductList()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        ProductLoading(),
        ProductListLoaded(products: [Product.product1]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'should emit [ProductLoading, ProductLoaded] when get product is successful.',
      build: () {
        when(mockProductRepository.getProduct("1")).thenAnswer((_) async => Product.product1);

        return productBloc;
      },
      act: (bloc) => bloc.add(const LoadProduct(id: "1")),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        ProductLoading(),
        ProductLoaded(product: Product.product1),
      ],
    );
  });
}
