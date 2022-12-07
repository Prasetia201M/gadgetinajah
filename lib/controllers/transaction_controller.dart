import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/models/transaction_model.dart';
import 'package:gadgetinajah/theme/styles.dart';
import 'package:gadgetinajah/ui/pages/home_page.dart';
import 'package:gadgetinajah/ui/pages/transaction_page.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/services/api.dart';
import 'package:http/http.dart' as http;

class TransactionController extends GetxController {
  TransactionService transactionService = TransactionService();
  TransactionModel? transactionList;
  final isLoading = false.obs;
  final shippingAddress = TextEditingController();

  Future<void> getTransaction() async {
    try {
      isLoading.value = true;
      transactionList = await transactionService.getAllTransaction();
      if (transactionList!.info == 'Mengambil list transaksi berhasil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createTransaction() async {
    if (shippingAddress.text.isNotEmpty) {
      final response =
          await transactionService.createTransactionOrder(shippingAddress.text);
      if (response == 'Success') {
        Get.snackbar('Success', 'Order success',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2));
        Future.delayed(
            const Duration(seconds: 3),
            () => Get.defaultDialog(
                title: 'Congratulations',
                content: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text('Give rate product now?'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.off(() => const HomePage()),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text('Maybe later')),
                        ),
                        GestureDetector(
                          onTap: () => Get.off(() => const TransactionPage())!
                              .then((value) => getTransaction()),
                          child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text('Sure')),
                        )
                      ],
                    ),
                  ],
                )));
      } else {
        Get.snackbar('Error', 'Cart item is empty',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.red);
        Future.delayed(
          const Duration(seconds: 3),
          () => Get.off(() => const HomePage()),
        );
      }
    } else {
      Get.snackbar('Error', 'Shipping address is required',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 5),
          backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTransaction();
  }
}

class TransactionService {
  
  Future<TransactionModel> getAllTransaction() async {
    final response = await http.get(Uri.parse(Api.transaksi),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return transactionModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> createTransactionOrder(String address) async {
    final response = await http.post(Uri.parse(Api.transaksi),
        headers: {'Authorization': 'Bearer ${AuthController.token}'},
        body: {'alamat': address});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Gagal';
    }
  }
}
