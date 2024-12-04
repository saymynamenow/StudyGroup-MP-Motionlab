import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_week2_sg/widgets/custom_button_widget.dart';
import 'package:motion_week2_sg/widgets/custom_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lottie/loginAnimate.json', height: 250),
          ),
          const SizedBox(
            height: 20,
          ),
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
                color: const Color(0xFF707070)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              children: [
                CustomTextfieldWidget(
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfieldWidget(
                  hintText: "Password",
                ),
                const SizedBox(
                  height: 42,
                ),
                CustomButtonWidget(
                  buttonText: "Login",
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Don't Have Account? Register",
                  style: GoogleFonts.roboto(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
