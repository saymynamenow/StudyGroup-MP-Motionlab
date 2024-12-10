import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? iconData;

  const CustomTextfieldWidget({
    super.key,
    this.hintText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff344e41),
              ),
            ),
            prefixIcon: iconData != null ? Icon(iconData) : null,
            hintText: hintText,
            hintStyle:
                GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
