import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gadgetinajah/ui/homePage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gadgetinajah/models/user_model.dart';
import 'package:gadgetinajah/ui/pages/login_page.dart';
import 'package:gadgetinajah/services/api.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  AuthConfig authConfig = AuthConfig();
  final isHide = true.obs;
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordConfirmCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final isLoading = false.obs;
  UserModel? userData;
  static String? token;
  String? message;


  Future<void> login() async {
    isLoading.value = true;

    final userCredential =
        await authConfig.signInWithEmail(emailCtrl.text, passwordCtrl.text);
    message = userCredential.info;

    if (message == 'Login Berhasil') {
      GetStorage box = GetStorage();
      String storeUserData = json.encode(userCredential);
      box.write("userData", storeUserData);
      userData = UserModel.fromJson(jsonDecode(box.read("userData")));
      token = userData!.data!.token;
      Future.delayed(
        const Duration(seconds: 2),
        () {
          isLoading.value = false;
          Get.snackbar('Success', message ?? '',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(bottom: 5),
              backgroundColor: Colors.green);
        },
      );
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.to(() => const HomePage2());
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          isLoading.value = false;
          Get.snackbar('Error', message ?? '',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(bottom: 5),
              backgroundColor: Colors.red);
        },
      );
    }
  }

  Future<void> register() async {
    isLoading.value = true;
    if (emailCtrl.text.isEmail) {
      final userCredential = await authConfig.signUpWithEmail(
          emailCtrl.text,
          passwordCtrl.text,
          passwordConfirmCtrl.text,
          nameCtrl.text,
          phoneCtrl.text);
      message = userCredential.info;
      if (message == 'Register Berhasil') {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            isLoading.value = false;
            Get.snackbar('Yeeeeaaah', message ?? '',
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.only(bottom: 5),
                backgroundColor: Colors.green);
          },
        );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Get.to(() => const LoginPage());
          },
        );
      } else {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            isLoading.value = false;
            Get.snackbar('Oh nooooo!', message ?? '',
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.only(bottom: 5),
                backgroundColor: Colors.red);
          },
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          isLoading.value = false;
          Get.snackbar('Oh nooooo!', 'Email address in wrong format ',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(bottom: 5),
              backgroundColor: Colors.red);
        },
      );
    }
  }

  Future<void> logout() async {
    final userCredential = await authConfig.signOut();
    if (userCredential == 'Berhasil Logout') {
      GetStorage box = GetStorage();
      box.erase();
      userData = null;
      if (userData == null) {
        Get.offAll(() => const LoginPage());
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // NOTE: Memanggil data user dari storage dan simpan ke variabel userData
    GetStorage box = GetStorage();
    if (box.read('userData') != null) {
      userData = UserModel.fromJson(jsonDecode(box.read("userData")));
      token = userData!.data!.token;
    }
  }
}

class AuthConfig {

  Future<UserModel> signInWithEmail(String email, String password) async {
    final response = await http.post(Uri.parse(Api.login), 
    body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<UserModel> signUpWithEmail(String email, String password,
      String passwordConfirm, String name, String phone) async {
    var response = await http.post(Uri.parse(Api.register), 
    body: {
      'name': name,
      'email': email,
      'handphone': phone,
      'password': password,
      'password_confirmation': passwordConfirm
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> signOut() async {
    final response = await http.post(Uri.parse(Api.logout),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return 'Berhasil Logout';
    } else {
      throw Exception('Gagal Logout');
    }
  }
}
