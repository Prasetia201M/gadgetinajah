import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/product_controller.dart';
import '../pages/detail_page.dart';
import 'home_category_item.dart';

class Secondlist extends StatelessWidget {
  const Secondlist({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    final productController = Get.put(ProductController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "Special Today!",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Obx(() => productController.isLoading.value
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : CarouselSlider(
                    items: [
                      for (var i = 0;
                          i <
                              productController
                                  .productData!.data.products.length;
                          i++)
                        GestureDetector(
                          onTap: () => Get.to(() => DetailPage(
                                productDetail: productController
                                    .productData!.data.products[i],
                              )),
                          child: HomeCategoryItem(
                            title: productController
                                .productData!.data.products[i].name,
                            subtitle: formatter.format(productController
                                .productData!.data.products[i].harga),
                            imageUrl: productController
                                .productData!.data.products[i].image,
                          ),
                        ),
                    ],
                    options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 6)),
                  )),
          ),
        ),
      ],
    );
  }
}
