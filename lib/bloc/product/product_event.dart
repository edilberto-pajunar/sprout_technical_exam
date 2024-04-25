part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  final String id;

  const LoadProduct({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class LoadProductList extends ProductEvent {
  final String skip;

  const LoadProductList({
    this.skip = "1",
  });

  @override
  List<Object> get props => [skip];
}
