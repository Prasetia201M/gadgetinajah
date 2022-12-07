import 'package:flutter/material.dart';
import 'package:gadgetinajah/app_properties.dart';
import 'package:get/get.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/theme/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
        backgroundColor: colorThree,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      'Profile Page',
                      textAlign: TextAlign.center,
                      style: subtitleStyle.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          authController.logout();
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              const Icon(
                Icons.account_box_rounded,
                size: 150,
                color: Colors.white,
              ),
              Text(
                authController.userData!.data!.user!.name ?? 'Unknown',
                style: subtitleStyle.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: whiteColor),
              ),
              Text(
                "( ${authController.userData!.data!.user!.role ?? 'Unknown'} ) ",
                style: subtitleStyle.copyWith(fontSize: 15, color: whiteColor),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Text(
                                "Email",
                                style: subtitleStyle.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: colorThree),
                              ),
                              Text(
                                authController.userData!.data!.user!.email ?? 'Unknown',
                                style: subtitleStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: colorThree),
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                "Handphone",
                                style: subtitleStyle.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: colorThree),
                              ),
                              Text(
                                authController.userData!.data!.user!.handphone ?? 'Unknown',
                                style: subtitleStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: colorThree),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorPrimary),
                            child: Center(
                              child: Text(
                                'Home',
                                style: subtitleStyle.copyWith(
                                    color: whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () {
                            authController.logout();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor),
                            child: Center(
                              child: Text(
                                'Logout',
                                style: subtitleStyle.copyWith(
                                    color: whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
