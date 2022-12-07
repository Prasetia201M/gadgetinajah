import 'package:flutter/material.dart';
import 'package:gadgetinajah/ui/pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gadgetinajah/theme/styles.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gadgetinajah',
      theme: ThemeData(primaryColor: secondaryColor),
      home: const SplashPage(),
    );
  }
}
