import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/models/review_model.dart';
import 'package:gadgetinajah/ui/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/services/api.dart';
import 'package:http/http.dart' as http;

class ReviewController extends GetxController {
  ReviewService reviewService = ReviewService();
  ReviewModel? userReview;
  final isLoading = false.obs;
  final star = 0.0.obs;
  final reviewCtrl = TextEditingController();
  final imagePicker = ImagePicker();
  XFile? image;

  Future<void> getReview(int currentProductId) async {
    isLoading.value = true;
    try {
      userReview = await reviewService.getAllReview(currentProductId);
      if (userReview!.info == 'Review Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addReview(int currentProductId) async {
    if (reviewCtrl.text.isNotEmpty && star.value != 0.0 && image != null) {
      File file = File(image!.path);
      final response = await reviewService.addUserReview(
          currentProductId, '${star.value}', reviewCtrl.text, file);
      if (response == 'Review berhasil di input') {
        Get.snackbar('Thanks for your rate', response,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.green);
        Future.delayed(
          const Duration(seconds: 2),
          () => Get.to(() => const HomePage()),
        );
      } else if (response == 'notfound') {
        Get.snackbar('Hmmm', 'Item not found anymore',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.red);
      } else {
        Get.snackbar('Hmmm', response,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar('Blank fields', 'Rating / Review / Photo is required',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 5),
          backgroundColor: Colors.red);
    }
  }

  void selectImg() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
  }
}

class ReviewService {

  Future<ReviewModel> getAllReview(int productId) async {
    final response = await http.get(Uri.parse('${Api.review}$productId'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return reviewModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> addUserReview(
      int productId, String rate, String review, File img) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('${Api.review}$productId'),)
      ..fields.addAll({'star': rate, 'review': review})
      ..headers.addAll({'Authorization': 'Bearer ${AuthController.token}'})
      ..files.add(await http.MultipartFile.fromPath('image', img.path));

    final response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      final res = createReviewModelFromJson(response.body);
      return res.info;
    } else if (response.statusCode == 400) {
      final res = ErrorReviewModel.fromJson(jsonDecode(response.body));
      return res.info;
    } else {
      return 'notfound';
    }
  }
}
