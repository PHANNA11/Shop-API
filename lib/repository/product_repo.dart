import 'package:api_fake_store/constant/publics.dart';
import 'package:api_fake_store/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductRepo {
  Future<Map<String, dynamic>?> getProduct() async {
    try {
      final response = await dio.get('/products');
      return {'data': productModelFromJson(response.data)};
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
