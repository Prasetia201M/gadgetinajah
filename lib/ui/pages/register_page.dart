import 'package:flutter/material.dart';
import 'package:gadgetinajah/app_properties.dart';
import 'package:gadgetinajah/controllers/auth_controller.dart';
import 'package:gadgetinajah/theme/styles.dart';
import 'package:get/get.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              //ini digubakan untuk mengambil tinggi asli dari layar
              minHeight: constraints.maxHeight),
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Container(
        width: MediaQuery.of(Get.context!).size.width,
        color: colorAccent,
        height: 300,
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: colorPrimary),
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.supervisor_account_rounded,
                  size: 150,
                  color: colorPrimary,
                ),
              ),
            ),
            const Text(
              'REGISTRATION',
              style: TextStyle(
                fontSize: 30,
                color: colorPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
                ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: constraints.maxHeight - 300),
                  child:   Container(
      decoration: const BoxDecoration(
        color: colorSecondary,
        // color: Color.fromARGB(255, 104, 93, 255),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            30,
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black26,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: authController.nameCtrl,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: colorPrimary,
                    ),
                    hintText: 'Name Here',
                    border: styleBorder(),
                    enabledBorder: styleBorder(),
                    focusedBorder: styleBorder(),
                    disabledBorder: styleBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    fillColor: colorAccent,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: authController.emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: colorPrimary,
                    ),
                    hintText: 'email@gmail.com',
                    border: styleBorder(),
                    enabledBorder: styleBorder(),
                    focusedBorder: styleBorder(),
                    disabledBorder: styleBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    fillColor: colorAccent,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: authController.phoneCtrl,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: colorPrimary,
                    ),
                    hintText: 'Phone Here',
                    border: styleBorder(),
                    enabledBorder: styleBorder(),
                    focusedBorder: styleBorder(),
                    disabledBorder: styleBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    fillColor: colorAccent,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => TextField(
                    controller: authController.passwordCtrl,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: authController.isHide.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: colorPrimary,
                      ),
                      suffixIcon: IconButton(
                            onPressed: () {
                              authController.isHide.toggle();
                            },
                            icon: authController.isHide.value
                                ? Icon(
                                    Icons.visibility,
                                    color: greyColor,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: primaryColor,
                                  ),
                          ),
                      hintText: 'password here',
                      border: styleBorder(),
                      enabledBorder: styleBorder(),
                      focusedBorder: styleBorder(),
                      disabledBorder: styleBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      fillColor: colorAccent,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => TextField(
                    controller: authController.passwordConfirmCtrl,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: authController.isHide.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: colorPrimary,
                      ),
                      
                      hintText: 'Confirmation Password',
                      border: styleBorder(),
                      enabledBorder: styleBorder(),
                      focusedBorder: styleBorder(),
                      disabledBorder: styleBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      fillColor: colorAccent,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              Obx(() => authController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GestureDetector(
                        onTap: () => authController.register(),
                        child: Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondaryColor),
                          child: Center(
                            child: Text(
                              'Join',
                              style: subtitleStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Login here',
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
                ),
              ],
            ),
          ),
        );
      }),
    
    );
  }

InputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 0,
        color: colorAccent,
      ),
    );
  }
}

  // body: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: ResponsiveLayout(
  //         mobile: SafeArea(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 margin: const EdgeInsets.only(top: 20),
  //                 width: 40,
  //                 height: 40,
  //                 decoration: BoxDecoration(
  //                     color: whiteColor,
  //                     borderRadius: BorderRadius.circular(10),
  //                     boxShadow: [
  //                       BoxShadow(
  //                           offset: const Offset(0, 5),
  //                           spreadRadius: 1,
  //                           blurRadius: 3,
  //                           color: greyColor)
  //                     ]),
  //                 child: IconButton(
  //                     padding: EdgeInsets.zero,
  //                     iconSize: 30,
  //                     onPressed: () {
  //                       Get.back();
  //                     },
  //                     icon: const Icon(
  //                       Icons.chevron_left,
  //                     )),
  //               ),
  //               const Center(child: CustomProfile()),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 40),
  //                 child: TextField(
  //                   controller: authController.nameCtrl,
  //                   keyboardType: TextInputType.name,
  //                   textInputAction: TextInputAction.next,
  //                   decoration: InputDecoration(
  //                     prefixIcon: Icon(
  //                       Icons.person,
  //                       color: greyColor,
  //                     ),
  //                     hintText: 'full name',
  //                     contentPadding: const EdgeInsets.symmetric(
  //                         vertical: 10, horizontal: 20),
  //                     filled: true,
  //                     fillColor: lightGreyColor,
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(12),
  //                         borderSide: BorderSide.none),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 20),
  //                 child: TextField(
  //                   controller: authController.phoneCtrl,
  //                   keyboardType: TextInputType.phone,
  //                   textInputAction: TextInputAction.next,
  //                   decoration: InputDecoration(
  //                     prefixIcon: Icon(
  //                       Icons.phone_android,
  //                       color: greyColor,
  //                     ),
  //                     hintText: 'phone',
  //                     contentPadding: const EdgeInsets.symmetric(
  //                         vertical: 10, horizontal: 20),
  //                     filled: true,
  //                     fillColor: lightGreyColor,
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(12),
  //                         borderSide: BorderSide.none),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 20),
  //                 child: TextField(
  //                   controller: authController.emailCtrl,
  //                   keyboardType: TextInputType.emailAddress,
  //                   textInputAction: TextInputAction.next,
  //                   decoration: InputDecoration(
  //                     prefixIcon: Icon(
  //                       Icons.email_outlined,
  //                       color: greyColor,
  //                     ),
  //                     hintText: 'email',
  //                     contentPadding: const EdgeInsets.symmetric(
  //                         vertical: 10, horizontal: 20),
  //                     filled: true,
  //                     fillColor: lightGreyColor,
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(12),
  //                         borderSide: BorderSide.none),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 20),
  //                 child: Obx(() => TextField(
  //                       controller: authController.passwordCtrl,
  //                       keyboardType: TextInputType.visiblePassword,
  //                       textInputAction: TextInputAction.done,
  //                       obscureText: authController.isHide.value,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(
  //                           Icons.lock,
  //                           color: greyColor,
  //                         ),
  //                         hintText: 'password',
  //                         suffixIcon: IconButton(
  //                           onPressed: () {
  //                             authController.isHide.toggle();
  //                           },
  //                           icon: authController.isHide.value
  //                               ? Icon(
  //                                   Icons.visibility,
  //                                   color: greyColor,
  //                                 )
  //                               : Icon(
  //                                   Icons.visibility,
  //                                   color: primaryColor,
  //                                 ),
  //                         ),
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             vertical: 10, horizontal: 20),
  //                         filled: true,
  //                         fillColor: lightGreyColor,
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                             borderSide: BorderSide.none),
  //                       ),
  //                     )),
  //               ),
  //               Expanded(
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(top: 20, bottom: 10),
  //                   child: Obx(() => TextField(
  //                         controller: authController.passwordConfirmCtrl,
  //                         keyboardType: TextInputType.visiblePassword,
  //                         textInputAction: TextInputAction.done,
  //                         obscureText: authController.isHide.value,
  //                         decoration: InputDecoration(
  //                           prefixIcon: Icon(
  //                             Icons.lock_reset,
  //                             color: greyColor,
  //                           ),
  //                           hintText: 'password confirmation',
  //                           contentPadding: const EdgeInsets.symmetric(
  //                               vertical: 10, horizontal: 20),
  //                           filled: true,
  //                           fillColor: lightGreyColor,
  //                           border: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(12),
  //                               borderSide: BorderSide.none),
  //                         ),
  //                       )),
  //                 ),
  //               ),
  //               Obx(() => authController.isLoading.value
  //                   ? const Center(
  //                       child: CircularProgressIndicator(),
  //                     )
  //                   : GestureDetector(
  //                       onTap: () => authController.register(),
  //                       child: Container(
  //                         width: Get.width,
  //                         height: 50,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             color: secondaryColor),
  //                         child: Center(
  //                           child: Text(
  //                             'Join',
  //                             style: subtitleStyle.copyWith(
  //                                 color: Colors.white,
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.w700),
  //                           ),
  //                         ),
  //                       ),
  //                     )),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 10),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Already have an a account?',
  //                       style: subtitleStyle,
  //                     ),
  //                     TextButton(
  //                         onPressed: () {
  //                           Get.back();
  //                         },
  //                         child: Text(
  //                           'Login',
  //                           style: subtitleStyle.copyWith(color: primaryColor),
  //                         ))
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         desktop: Row(
  //           children: [
  //             Expanded(
  //                 flex: 2,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     const CustomProfile(
  //                       h: 200,
  //                       w: 200,
  //                     ),
  //                     Container(
  //                       margin: const EdgeInsets.only(top: 20),
  //                       width: 100,
  //                       height: 50,
  //                       decoration: BoxDecoration(
  //                           color: secondaryColor,
  //                           borderRadius: BorderRadius.circular(18)),
  //                       child: Center(
  //                         child: Text(
  //                           'Upload',
  //                           style: subtitleStyle.copyWith(
  //                               color: whiteColor,
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.w700),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 )),
  //             Expanded(
  //               flex: 3,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Register',
  //                     style: titleStyle.copyWith(fontSize: 32),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 40),
  //                     child: TextField(
  //                       controller: authController.nameCtrl,
  //                       keyboardType: TextInputType.name,
  //                       textInputAction: TextInputAction.next,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(
  //                           Icons.person,
  //                           color: greyColor,
  //                         ),
  //                         hintText: 'full name',
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             vertical: 10, horizontal: 20),
  //                         filled: true,
  //                         fillColor: lightGreyColor,
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                             borderSide: BorderSide.none),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 20),
  //                     child: TextField(
  //                       controller: authController.phoneCtrl,
  //                       keyboardType: TextInputType.phone,
  //                       textInputAction: TextInputAction.next,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(
  //                           Icons.phone_android,
  //                           color: greyColor,
  //                         ),
  //                         hintText: 'phone',
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             vertical: 10, horizontal: 20),
  //                         filled: true,
  //                         fillColor: lightGreyColor,
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                             borderSide: BorderSide.none),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 20),
  //                     child: TextField(
  //                       controller: authController.emailCtrl,
  //                       keyboardType: TextInputType.emailAddress,
  //                       textInputAction: TextInputAction.next,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(
  //                           Icons.email_outlined,
  //                           color: greyColor,
  //                         ),
  //                         hintText: 'email',
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             vertical: 10, horizontal: 20),
  //                         filled: true,
  //                         fillColor: lightGreyColor,
  //                         border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                             borderSide: BorderSide.none),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 20),
  //                     child: Obx(() => TextField(
  //                           controller: authController.passwordCtrl,
  //                           keyboardType: TextInputType.visiblePassword,
  //                           textInputAction: TextInputAction.done,
  //                           obscureText: authController.isHide.value,
  //                           decoration: InputDecoration(
  //                             prefixIcon: Icon(
  //                               Icons.lock,
  //                               color: greyColor,
  //                             ),
  //                             hintText: 'password',
  //                             suffixIcon: IconButton(
  //                               onPressed: () {
  //                                 authController.isHide.toggle();
  //                               },
  //                               icon: authController.isHide.value
  //                                   ? Icon(
  //                                       Icons.visibility,
  //                                       color: greyColor,
  //                                     )
  //                                   : Icon(
  //                                       Icons.visibility,
  //                                       color: primaryColor,
  //                                     ),
  //                             ),
  //                             contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 10, horizontal: 20),
  //                             filled: true,
  //                             fillColor: lightGreyColor,
  //                             border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(12),
  //                                 borderSide: BorderSide.none),
  //                           ),
  //                         )),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 20, bottom: 10),
  //                     child: Obx(() => TextField(
  //                           controller: authController.passwordConfirmCtrl,
  //                           keyboardType: TextInputType.visiblePassword,
  //                           textInputAction: TextInputAction.done,
  //                           obscureText: authController.isHide.value,
  //                           decoration: InputDecoration(
  //                             prefixIcon: Icon(
  //                               Icons.lock_reset,
  //                               color: greyColor,
  //                             ),
  //                             hintText: 'password confirmation',
  //                             contentPadding: const EdgeInsets.symmetric(
  //                                 vertical: 10, horizontal: 20),
  //                             filled: true,
  //                             fillColor: lightGreyColor,
  //                             border: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(12),
  //                                 borderSide: BorderSide.none),
  //                           ),
  //                         )),
  //                   ),
  //                   Obx(() => authController.isLoading.value
  //                       ? const Center(
  //                           child: CircularProgressIndicator(),
  //                         )
  //                       : GestureDetector(
  //                           onTap: () => authController.register(),
  //                           child: Container(
  //                             margin: const EdgeInsets.only(top: 20),
  //                             width: Get.width,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 color: secondaryColor),
  //                             child: Center(
  //                               child: Text(
  //                                 'Join',
  //                                 style: subtitleStyle.copyWith(
  //                                     color: Colors.white,
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.w700),
  //                               ),
  //                             ),
  //                           ),
  //                         )),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 20),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           'Already have an a account?',
  //                           style: subtitleStyle,
  //                         ),
  //                         TextButton(
  //                             onPressed: () {
  //                               Get.back();
  //                             },
  //                             child: Text(
  //                               'Login',
  //                               style:
  //                                   subtitleStyle.copyWith(color: primaryColor),
  //                             ))
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
    
