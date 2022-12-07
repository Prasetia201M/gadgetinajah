import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/models/wishlist_model.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/services/api.dart';
import 'package:http/http.dart' as http;

class WishlistController extends GetxController {
  WishlistService wishlistService = WishlistService();
  WishlistModel? favoriteList;
  final isLoading = false.obs;
  final favoriteItem = {}.obs;

  Future<void> getWishlist() async {
    try {
      isLoading.value = true;
      favoriteList = await wishlistService.getFavoriteItem();
      if (favoriteList!.info == 'Data Berhasil Diambil') {
        isLoading.value = false;
        for (var i = 0; i < favoriteList!.data.length; i++) {
          favoriteItem[favoriteList!.data[i].productId] =
              favoriteList!.data[i].id;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> toggleFavorite(int productId) async {
    final isExist = favoriteItem.containsKey(productId);
    if (isExist) {
      int wishlistId = favoriteItem[productId];
      final response = await wishlistService.removeFromFavorite('$wishlistId');
      if (response == 'Success') {
        favoriteItem.remove(productId);
      } else {
        debugPrint('Gagal hapus favorite');
      }
    } else {
      final response = await wishlistService.addToFavorite('$productId');
      if (response.info == 'Wishlist berhasil di input') {
        favoriteItem[productId] = response.data!.id;
      } else {
        debugPrint('Gagal tambah favorite');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWishlist();
  }
}

class WishlistService {

  Future<WishlistModel> getFavoriteItem() async {
    final response = await http.get(Uri.parse(Api.wishlist),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return wishlistModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<CreateWishlistModel> addToFavorite(String productId) async {
    final response = await http.post(Uri.parse(Api.wishlist),
        headers: {'Authorization': 'Bearer ${AuthController.token}'},
        body: {'product_id': productId});
    if (response.statusCode == 200 || response.statusCode == 400) {
      return CreateWishlistModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> removeFromFavorite(String wishlistId) async {
    final response = await http.delete(
        Uri.parse('${Api.wishlist}$wishlistId'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Gagal';
    }
  }
}
