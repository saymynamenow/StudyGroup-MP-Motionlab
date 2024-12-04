import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfieldWidget extends StatelessWidget {
  String? hintText;

  CustomTextfieldWidget({
    super.key,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.email),
        hintText: hintText,
        hintStyle:
            GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 14),
      ),
    );
  }
}
