import 'package:api_fake_store/controller/product_controller.dart';
import 'package:api_fake_store/model/product_model.dart';
import 'package:api_fake_store/widget/styles.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({Key? key, required this.product}) : super(key: key);
  ProductModel product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct>
    with SingleTickerProviderStateMixin {
  final productController = Get.put(ProductContrller());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: iconColors,
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          title: Text(
            widget.product.title.toString(),
            style: appbarTextStyle,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                Share.share(widget.product.image.toString(),
                    subject: 'Look what I made! ${widget.product.image}');
              },
              icon: const Icon(Icons.share),
              color: iconColors,
            ),
            const SizedBox(
              width: 10,
            ),
            Badge(
              position: BadgePosition.topEnd(top: -10, end: -12),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeStyle: const BadgeStyle(badgeColor: Colors.white),
              badgeContent:
                  const Icon(Icons.shopping_cart, color: Colors.red, size: 25),
              badgeAnimation: const BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Wrap(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: NetworkImage(
                  widget.product.image.toString(),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 8,
                  bottom: 8,
                  top: 8,
                ),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 120,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.product.title.toString(),
                              style: titleTextStyleBold,
                              maxLines: 2,
                            ),
                            Text(
                              '\$ ${widget.product.price.toString()}',
                              style: priceTextStyleBold,
                            ),
                            const Text(
                              'Pending',
                              style: statusTextStyleBold,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 30,
                              color: priceColor,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: widget.product.rating!.rate!,
                            minRating: 1,
                            itemSize: 25,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 80,
                width: double.infinity,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image(
                        image: NetworkImage(widget.product.image.toString())),
                  ),
                  title: const Text(
                    'TV Shop',
                    style: appbarTextStyle,
                  ),
                  subtitle: const Text(
                    'មាន 245 ផលិតផល',
                    style: descriptionTextStyle,
                  ),
                  trailing: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'មើលហាង',
                          style: textBottonStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: priceColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                child: Wrap(
                  children: [
                    const TabBar(
                        labelColor: textColors,
                        labelStyle: statusTextStyleBold,
                        tabs: [
                          Tab(
                            text: 'discription',
                          ),
                          Tab(
                            text: 'Info',
                          )
                        ]),
                    Text(
                      widget.product.description.toString(),
                      style: descriptionTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
