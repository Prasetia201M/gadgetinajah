import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gadgetinajah/ui/pages/detail_page.dart';
import 'package:gadgetinajah/ui/widgets/home_category_item.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/laptop_controller .dart';
import '../controllers/product_controller.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    var size = MediaQuery.of(context).size;
    final productController = Get.put(ProductController());
    final laptopController = Get.put(LaptopController());

    return RefreshIndicator(
      onRefresh: () async {
        productController.getProduct();
        laptopController.getProduct();
      },
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 11,
              color: const Color(0xff2874F0),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: InkWell(
                    onTap: () {
                      // Get.to(() => const SearchPage());
                    },
                    child: Row(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.search),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Search Here !',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Column(
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
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
                  child: Text(
                    "Winter Event !",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
                SizedBox(
                  height: size.height / 5,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/phone_two.png",
                                height: size.height / 7,
                              ),
                            ),
                            const Text(
                              "Xiaomi \n Disc 50%",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/ipad.png",
                                height: size.height / 7,
                              ),
                            ),
                            const Text(
                              "Handphone \n Populer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/airpods.png",
                                height: size.height / 7,
                              ),
                            ),
                            const Text(
                              "Aksesoris \n Buy 1 Pay 1",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 2.45,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 8, top: 8),
                      child: Text(
                        'Featured Brand',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 8),
                      child: Text(
                        'Sponsored',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Image.asset(
                      "assets/promo.png",
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              ),
            ),

            // Firstlist(),
            // const Secondlist(),
            // Thirdlist(),
            // const SizedBox(
            //   height: 5,
            // ),
            // Fifthlist(),
            // Sixthlist(),
            // Seventhlist(),
            // const SizedBox(
            //   height: 5,
            // )
          ],
        ),
      ),
    );
  }
}
