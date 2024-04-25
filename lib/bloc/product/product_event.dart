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
  final int page;

  const LoadProductList({
    this.page = 1,
  });

  @override
  List<Object> get props => [page];
}
