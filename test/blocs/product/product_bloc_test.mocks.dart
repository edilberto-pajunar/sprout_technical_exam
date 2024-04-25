// Mocks generated by Mockito 5.4.4 from annotations
// in sprout_technical_exam/test/blocs/product/product_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sprout_technical_exam/model/product.dart' as _i2;
import 'package:sprout_technical_exam/repository/product/product_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProduct_0 extends _i1.SmartFake implements _i2.Product {
  _FakeProduct_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i3.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Product> getProduct(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [id],
        ),
        returnValue: _i4.Future<_i2.Product>.value(_FakeProduct_0(
          this,
          Invocation.method(
            #getProduct,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Product>);

  @override
  _i4.Future<List<_i2.Product>> getProducts(String? skip) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [skip],
        ),
        returnValue: _i4.Future<List<_i2.Product>>.value(<_i2.Product>[]),
      ) as _i4.Future<List<_i2.Product>>);
}
