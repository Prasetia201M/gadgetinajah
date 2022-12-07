import 'package:flutter/material.dart';
import 'package:gadgetinajah/ui/homePage.dart';
import 'package:gadgetinajah/ui/splashscreen.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   // NOTE: Mengecek apakah user pernah login atau belum
  //   final authController = Get.put(AuthController());
  //   Future.delayed(
  //     const Duration(seconds: 2),
  //     () => Get.off(() => authController.userData != null
  //         ? const HomePage()
  //         : const LoginPage()),
  //   );
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             'gadgetinajah',
  //             style: titleStyle.copyWith(fontSize: 48),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 10),
  //             child: Text(
  //               'your perfect room',
  //               style: taglineStyle,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

@override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(() => authController.userData != null
          ? const HomePage2()
          : const Splash()),
    );
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: const BoxDecoration(color: Colors.yellow),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: 1.0,
                      child: Image.asset('assets/logo.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Powered by '),
                          TextSpan(
                              text: 'Developer',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
