import 'package:get/get.dart';
import 'package:gadgetinajah/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:gadgetinajah/ui/pages/cart_page.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/services/api.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  CartService cartService = CartService();
  CartModel? cartData;
  final isLoading = false.obs;
  final quantity = 1.obs;
  final total = 0.obs;
  Future<void> getCart() async {
    try {
      isLoading.value = true;
      cartData = await cartService.getCartItem();
      if (cartData!.info == 'Keranjang Berhasil Diambil') {
        isLoading.value = false;
        List listPrice = [];
        if (cartData!.data.isNotEmpty) {
          for (var i = 0; i < cartData!.data.length; i++) {
            final int subtotal;
            subtotal = cartData!.data[i].product.harga * cartData!.data[i].qty;
            listPrice.add(subtotal);
          }
          total.value = listPrice.reduce((value, element) => value + element);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addToCart(int productId) async {
    try {
      final response =
          await cartService.addCartItem(productId.toString(), '$quantity');
      if (response == 'Success') {
        Get.to(() => const CartPage());
        getCart();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeFromCart(int cartId) async {
    try {
      final response = await cartService.removeCartItem(cartId);
      if (response == 'Success') {
        total.value = 0;
        getCart();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCart();
  }
}

class CartService {

  Future<CartModel> getCartItem() async {
    final response = await http.get(Uri.parse(Api.keranjang),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> addCartItem(String productId, String quantity) async {
    final response = await http.post(Uri.parse(Api.keranjang),
        headers: {'Authorization': 'Bearer ${AuthController.token}'},
        body: {'product_id': productId, 'qty': quantity});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      throw Exception('Gagal menambahkan data');
    }
  }

  Future<String> removeCartItem(int cartId) async {
    final response = await http.delete(
        Uri.parse('${Api.keranjang}/$cartId'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      throw Exception('Gagal menghapus data');
    }
  }
}
