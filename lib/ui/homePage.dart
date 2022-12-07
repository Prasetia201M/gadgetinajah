import 'package:flutter/material.dart';
import 'package:gadgetinajah/theme/styles.dart';
import 'package:gadgetinajah/ui/body.dart';
import 'package:gadgetinajah/ui/pages/cart_page.dart';
import 'package:gadgetinajah/ui/pages/profile_page.dart';
import 'package:gadgetinajah/ui/pages/transaction_page.dart';
import 'package:gadgetinajah/ui/pages/wishlist_page.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Gadgetin Ajah"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: (){Get.to(() => const CartPage()); },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: const Center(
                  child: Icon(
                    Icons.face,
                    size: 70,
                    color: Colors.black,
                  ),
                ),
              ),
              accountName:
                  Text(authController.userData!.data!.user!.name ?? 'Unknown'),
              accountEmail: const Text('test@gmail.com'),
            ),
            _drawerItem(
                icon: Icons.list, 
                text: 'Category', 
                onTap: () => print('ktg')),
            _drawerItem(
                icon: Icons.account_balance_wallet_rounded,
                text: 'Transaction',
                onTap: () { Get.to(() => const TransactionPage()); }),
            _drawerItem(
                icon: Icons.account_circle_rounded,
                text: 'Profile',
                onTap: () { Get.to(() => const ProfilePage()); }),
            _drawerItem(
                icon: Icons.bookmark,
                text: 'Wishlist',
                onTap: () { Get.to(() => const WishlistPage()); }),
            const Divider(height: 25, thickness: 1),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Text("Other",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  )),
            ),
            _drawerItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () => authController.logout()),
          ],
        ),
      ),
      body: Body(),
    );
  }

  Widget _drawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
