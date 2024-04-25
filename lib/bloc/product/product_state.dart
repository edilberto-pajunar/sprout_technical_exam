part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductListLoaded extends ProductState {
  final List<Product> products;
  final int page;

  const ProductListLoaded({
    required this.products,
    this.page = 0,
  });

  @override
  List<Object> get props => [products, page];
}

final class ProductLoaded extends ProductState {
  final Product product;

  const ProductLoaded({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
