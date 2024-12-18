import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceItem extends StatelessWidget {
  final String? label;
  final String? value;
  const InvoiceItem({super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label!,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xFF757575)),
        ),
        Text(
          value!,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14),
        )
      ],
    );
  }
}
