import 'package:flutter/material.dart';
import 'package:gadgetinajah/app_properties.dart';
import 'package:gadgetinajah/ui/homePage.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/controllers/transaction_controller.dart';
import 'package:gadgetinajah/theme/styles.dart';
import 'package:gadgetinajah/ui/pages/rate_product_page.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.put(TransactionController());
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                        padding: const EdgeInsets.only(left: 20),
                        iconSize: 30,
                        onPressed: () {
                          Get.to(() => const HomePage2());
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        )),
                  ),
                  Text(
                    'My Orders',
                    textAlign: TextAlign.center,
                    style: subtitleStyle.copyWith(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: () => transactionController.getTransaction(),
                        child: Icon(
                          Icons.refresh,
                          color: secondaryColor,
                        )),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              child: TabBar(
                  indicatorColor: const Color.fromARGB(255, 64, 0, 255),
                  indicatorWeight: 3,
                  isScrollable: false,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 3),
                  tabs: [
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          "Belum Dibayar",
                          style: TextStyle(
                            color: colorThree,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          "Sedang Dikirim",
                          style: TextStyle(
                              color: Color.fromARGB(255, 156, 142, 18)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          "Selesai",
                          style: TextStyle(color: Color(0xFF258C28)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          "Dibatalkan",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Obx(() => transactionController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : transactionController.transactionList!.data!.isEmpty
                      ? const Center(
                          child: Text('No Transaction'),
                        )
                      : TabBarView(children: [
                          ListView.builder(
                            itemCount: transactionController
                                .transactionList!.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: greyColor,
                                          offset: const Offset(0, 5),
                                          blurRadius: 10,
                                          spreadRadius: 1)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Information:',
                                            style: subtitleStyle.copyWith(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            DateFormat('d MMM yyyy').format(
                                                transactionController
                                                    .transactionList!
                                                    .data![index]
                                                    .createdAt),
                                            style: TextStyle(color: greyColor),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3),
                                        child: Text('Address:'),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              transactionController
                                                  .transactionList!
                                                  .data![index]
                                                  .alamat,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text('Total Amount:',
                                                    style: TextStyle(
                                                        color: greyColor)),
                                                Text(
                                                  NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp',
                                                          decimalDigits: 2)
                                                      .format(
                                                          transactionController
                                                              .transactionList!
                                                              .data![index]
                                                              .total),
                                                  style: subtitleStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  Get.to(() => RateProductPage(
                                                        transactionData:
                                                            transactionController
                                                                .transactionList!
                                                                .data![index],
                                                      )),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Rate ⭐',
                                                  style: subtitleStyle.copyWith(
                                                      fontSize: 14,
                                                      color: whiteColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              transactionController
                                                      .transactionList!
                                                      .data![index]
                                                      .status
                                                      .capitalizeFirst ??
                                                  '',
                                              style: subtitleStyle.copyWith(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const Center(
                            child: Text('Delivering'),
                          ),
                          const Center(
                            child: Text('Delivered'),
                          ),
                          const Center(
                            child: Text('Cancelled'),
                          )
                        ])),
            )
          ],
        ),
      )),
    );
  }
}
