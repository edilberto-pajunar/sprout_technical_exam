import 'dart:convert';
import 'dart:developer';

import 'package:sprout_technical_exam/config/constant/api.dart';
import 'package:sprout_technical_exam/model/product.dart';
import 'package:sprout_technical_exam/repository/product/base_product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends BaseProductRepository {
  @override
  Future<Product> getProduct(String id) async {
    final uri = Uri.https(DummyApi.baseUrl, "/products/$id", {});

    final response = await http.get(uri);
    log("Calling: $uri");

    if (response.statusCode == 200) {
      log("Response: ${response.body}");
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Something went wrong: ${response.reasonPhrase}");
    }
  }

  @override
  Future<List<Product>> getProducts(String skip) async {
    final uri = Uri.https(DummyApi.baseUrl, "/products", {
      "limit": "10",
      "skip": "skip",
      "select": ["title", "price", "thumbnail", "stock", "discountPercentage"],
    });

    log("Calling: $uri");

    final response = await http.get(uri);
    log("Response: ${response.body}");

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["products"];
      return result.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Something went wrong: ${response.reasonPhrase}");
    }
  }
}
