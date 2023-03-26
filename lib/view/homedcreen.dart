import 'package:api_fake_store/controller/product_controller.dart';
import 'package:api_fake_store/model/product_model.dart';
import 'package:api_fake_store/view/detail_procduc.dart';
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
                    //semanticChildCount: 3,
                    //crossAxisCount: 3,

                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    itemBuilder: (context, index) {
                      final product = productController.listProduct[index];
                      return buildProductCart(product);
                      // return Tile(
                      //   index: index,
                      //   extent: (index % 7 + 1) * 30,
                      // );
                    },
                    maxCrossAxisExtent: 250,
                  );
          },
        ));
  }

  Widget buildProductCart(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Get.to(() => DetailProduct(product: product)),
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              boxShadow: const [
                // BoxShadow(
                //     color: Colors.white,
                //     offset: Offset(3, 3),
                //     blurStyle: BlurStyle.inner,
                //     blurRadius: 10,
                //     spreadRadius: 3)
              ],
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(children: [
              Expanded(
                flex: 3,
                child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(product.image.toString()),
                      ),
                    )),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.title.toString(),
                      style: titleTextStyleBold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      '\$ ${product.price}',
                      style: priceTextStyleBold,
                    )
                  ],
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
