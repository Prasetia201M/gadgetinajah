import 'package:flutter/material.dart';
import 'package:gadgetinajah/controllers/cart_controller.dart';
import 'package:gadgetinajah/theme/styles.dart';
import 'package:gadgetinajah/ui/pages/checkout_page.dart';
import 'package:gadgetinajah/ui/widgets/product_cart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app_properties.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: const Color(0xffe7e7e7),
      body: RefreshIndicator(
        onRefresh: () => cartController.getCart(),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                    Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 40,
                    height: 40,
                    
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new, color: colorThree,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      'Keranjang Belanjaan',
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => cartController.isLoading.value
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : cartController.cartData!.data.isEmpty
                      ? const Expanded(
                          child: Center(child: Text('No item in cart')))
                      : Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 200),
                                child: ListView.builder(
                                  itemCount:
                                      cartController.cartData!.data.length,
                                  itemBuilder: (context, index) {
                                    return ProductCart(
                                      cardList:
                                          cartController.cartData!.data[index],
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: Get.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(-5, -5),
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            color: greyColor),
                                      ],
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order Information',
                                          style: subtitleStyle.copyWith(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Subtotal',
                                                style: subtitleStyle.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: greyColor),
                                              ),
                                              Text(
                                                NumberFormat.currency(
                                                        locale: 'id',
                                                        symbol: 'Rp',
                                                        decimalDigits: 2)
                                                    .format(cartController
                                                        .total.value),
                                                style: subtitleStyle.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Shipping Cost',
                                                style: subtitleStyle.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: greyColor),
                                              ),
                                              Text(
                                                'free',
                                                style: subtitleStyle.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: secondaryColor,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total Payment',
                                              style: subtitleStyle.copyWith(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp',
                                                      decimalDigits: 2)
                                                  .format(cartController
                                                      .total.value),
                                              style: subtitleStyle.copyWith(
                                                  color: primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () => Get.to(
                                              () => const CheckoutPage()),
                                          child: Container(
                                            height: 40,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Proceed to checkout',
                                                  style: subtitleStyle.copyWith(
                                                      color: whiteColor),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Icon(
                                                      Icons.chevron_right),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
            )
          ],
        )),
      ),
    );
  }
}
