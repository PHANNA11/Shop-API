import 'dart:developer';

import 'package:api_fake_store/model/product_model.dart';
import 'package:api_fake_store/repository/product_repo.dart';
import 'package:get/state_manager.dart';

class ProductContrller extends GetxController {
  final productRepo = ProductRepo();
  final _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  final _listProduct = <ProductModel>[].obs;
  List<ProductModel> get listProduct => _listProduct;

  Future<void> getProduct() async {
    Future.value();
    _isLoading.value = true;
    final responseData = await productRepo.getProduct();
    if (responseData != null) {
      log(responseData['data'].toString());
      _listProduct.assignAll(responseData['data']);
    }
    _isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }
}
