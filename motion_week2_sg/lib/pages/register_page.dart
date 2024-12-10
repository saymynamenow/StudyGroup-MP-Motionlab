import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week2_sg/widgets/custom_button_widget.dart';
import 'package:motion_week2_sg/widgets/custom_textfield_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              const SizedBox(
                height: 203,
              ),
              Text(
                "Register",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Create your account for Happy Shopping",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: const Color(0xFF707070),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 54,
              ),
              const CustomTextfieldWidget(
                hintText: "Full Name",
                iconData: Icons.person_2_outlined,
              ),
              const CustomTextfieldWidget(
                hintText: "Email",
                iconData: Icons.mail,
              ),
              const CustomTextfieldWidget(
                hintText: "Password",
                iconData: Icons.lock,
              ),
              const CustomTextfieldWidget(
                hintText: "Confirm Password",
                iconData: Icons.lock,
              ),
              const SizedBox(
                height: 22,
              ),
              const CustomButtonWidget(
                buttonText: "Register",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account? ",
                    style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff3a5a40)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
