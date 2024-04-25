import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sprout_technical_exam/model/product.dart';
import 'package:sprout_technical_exam/repository/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<LoadProductList>(_onLoadProductList);
  }

  void _onLoadProduct(LoadProduct event, emit) async {
    emit(ProductLoading());
    try {
      final Product product = await _productRepository.getProduct(event.id);
      emit(ProductLoaded(product: product));
    } catch (e) {
      log("Something went wrong: $e");
    }
  }

  void _onLoadProductList(LoadProductList event, emit) async {
    emit(ProductLoading());
    try {
      final List<Product> products = await _productRepository.getProducts("${event.page}0");
      emit(ProductListLoaded(products: products, page: event.page));
    } catch (e) {
      log("Something went wrong: $e");
    }
  }
}
