import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/laptop_controller .dart';
import '../../controllers/product_controller.dart';

class Thirdlist extends StatefulWidget {
  @override
  _ThirdlistState createState() => _ThirdlistState();
}

class _ThirdlistState extends State<Thirdlist> {
  @override
  Widget build(BuildContext context) {
    final laptopController = Get.put(LaptopController());
    final productController = Get.put(ProductController());

    var size = MediaQuery.of(context).size;
    return SizedBox(
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
