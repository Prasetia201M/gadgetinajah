import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/models/product_model.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/services/api.dart';
import 'package:http/http.dart' as http;

class LaptopController extends GetxController {
  LaptopService laptopService = LaptopService();
  ProductModel? productData;
  final isLoading = false.obs;

  Future<void> getProduct() async {
    try {
      isLoading.value = true;
      productData = await laptopService.getLaptopByCategory();
      if (productData!.info == 'Category Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
}

class LaptopService {

  Future<ProductModel> getLaptopByCategory() async {
    final response = await http.get(Uri.parse('${Api.category}/26'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}
