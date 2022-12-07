import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gadgetinajah/app_properties.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/controllers/cart_controller.dart';
import 'package:gadgetinajah/controllers/review_controller.dart';
import 'package:gadgetinajah/controllers/wishlist_controller.dart';
import 'package:gadgetinajah/theme/styles.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.productDetail});
  final dynamic productDetail;
  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartController());
    final reviewController = Get.put(ReviewController());
    reviewController.getReview(productDetail.id);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(top: 20),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'Detail Product',
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Obx(() => IconButton(
                      padding: const EdgeInsets.only(top: 20),
                      onPressed: () {
                        wishlistController.toggleFavorite(productDetail.id);
                      },
                      iconSize: 30,
                      icon: wishlistController.favoriteItem
                              .containsKey(productDetail.id)
                          ? Icon(
                              Icons.favorite,
                              color: secondaryColor,
                            )
                          : const Icon(Icons.favorite_border)))
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.network(
                                  productDetail.image,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                        productDetail.name,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                locale: 'id',
                                                symbol: 'Rp',
                                                decimalDigits: 2)
                                            .format(productDetail.harga),
                                        style: subtitleStyle.copyWith(
                                            color: primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.shopping_cart_outlined, size:25, color: colorTop,),
                                          GestureDetector(
                                            onTap: () => cartController
                                                .decreaseQuantity(),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              
                                              child: const Icon(
                                                CupertinoIcons.minus,
                                                size: 20,
                                                color: colorThree,
                                              ),
                                            ),
                                          ),
                                          Obx(() => Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  '${cartController.quantity.value}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )),
                                          GestureDetector(
                                            onTap: () => cartController
                                                .increaseQuantity(),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              
                                              child: const Icon(
                                                CupertinoIcons.plus,
                                                size: 20,
                                                color: colorThree,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ,
                                    GestureDetector(
                          onTap: () =>
                              cartController.addToCart(productDetail.id),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: colorThree,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style:
                                    subtitleStyle.copyWith(color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          // decoration: BoxDecoration(
                          //   color: primaryColor,
                          //   borderRadius: BorderRadius.circular(14),
                          // ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(productDetail.name,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: blackColor,
                                ),
                                const Text("Description:\n",
                                    style: TextStyle(fontSize: 16)),
                                Text(
                                  productDetail.deskripsi,
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                ),
                              ]),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Reviews',
                            style: titleStyle,
                          ),
                        ),
                        Obx(() => reviewController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : reviewController.userReview!.data.isEmpty
                                ? const Center(
                                    child: Text('There is no review'),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: reviewController
                                        .userReview!.data.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              reviewController.userReview!
                                                  .data[index].user.name,
                                              style: subtitleStyle.copyWith(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RatingStars(
                                                    starCount: 5,
                                                    valueLabelVisibility: false,
                                                    value: reviewController
                                                        .userReview!
                                                        .data[index]
                                                        .star
                                                        .toDouble(),
                                                  ),
                                                  Text(
                                                    DateFormat('d MMM yyyy')
                                                        .format(reviewController
                                                            .userReview!
                                                            .data[index]
                                                            .updatedAt),
                                                    style: TextStyle(
                                                        color: greyColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(reviewController.userReview!
                                                .data[index].review),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  reviewController.userReview!
                                                      .data[index].image,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
