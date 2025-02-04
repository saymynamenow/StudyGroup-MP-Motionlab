import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_week2_sg/pages/login_page/controller/login_controller.dart';
import 'package:motion_week2_sg/widgets/custom_button_widget.dart';
import 'package:motion_week2_sg/widgets/custom_textfield_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: controller.checkedLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.offNamed('/');
            });
            return const SizedBox();
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/lottie/loginAnimate.json',
                    height: 250,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Happy Shopping All",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF707070),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20),
                    child: Column(
                      children: [
                        CustomTextfieldWidget(
                          hintText: "Email",
                          iconData: Icons.mail,
                          editingController: controller.username,
                        ),
                        CustomTextfieldWidget(
                          hintText: "Password",
                          iconData: Icons.lock,
                          editingController: controller.password,
                        ),
                        CustomButtonWidget(
                          buttonText: controller.isLoading.value
                              ? "Loading..."
                              : "Login",
                          function: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Have Account? ",
                              style: GoogleFonts.roboto(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "Register",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: const Color(0xff3a5a40),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
