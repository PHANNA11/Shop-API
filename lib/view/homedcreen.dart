import 'package:api_fake_store/controller/product_controller.dart';
import 'package:api_fake_store/widget/build_product_widget.dart';
import 'package:api_fake_store/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final productController = Get.put(ProductContrller());
  @override
  Widget build(BuildContext context) {
    //productController.getProduct;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'TECHBiz SHOP',
            style: appbarTextStyleBold,
          ),
        ),
        body: Obx(
          () {
            return productController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AlignedGridView.extent(
                    itemCount: productController.listProduct.length,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    itemBuilder: (context, index) {
                      final product = productController.listProduct[index];
                      return BuildproductWidget(
                        product: product,
                      );
                    },
                    maxCrossAxisExtent: 250,
                  );
          },
        ));
  }
}
