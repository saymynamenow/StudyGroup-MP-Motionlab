import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';
import 'package:motion_week2_sg/widgets/custom_button_widget.dart';
import 'package:motion_week2_sg/widgets/invoice_item.dart';
import 'package:intl/intl.dart';

class Transaction extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('d-M-y').format(now);

    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back_ios_new_rounded),
            title: const Center(
              child: Text("Invoice"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/lottie/succes.json',
                    height: 200,
                    repeat: false,
                  ),
                ),
                Text(
                  "Transaction Success",
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  "\$${controller.totalPrice}",
                  style: GoogleFonts.roboto(
                      fontSize: 27, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 33,
                ),
                const InvoiceItem(
                  label: "Inovice Number",
                  value: "000085752257",
                ),
                const SizedBox(
                  height: 14,
                ),
                InvoiceItem(
                  label: "Transaction Date",
                  value: formatter,
                ),
                const SizedBox(
                  height: 14,
                ),
                const InvoiceItem(
                  label: "Payment Methode",
                  value: "Bank Transfer",
                ),
                const SizedBox(
                  height: 70,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Detail Pesanan",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    )),
                const SizedBox(
                  height: 14,
                ),
                const InvoiceItem(
                  label: "Order Name",
                  value: "Fiqri Ananda",
                ),
                const SizedBox(
                  height: 14,
                ),
                const InvoiceItem(
                  label: "Order Email",
                  value: "fiqriananda@proton.me",
                ),
                const SizedBox(
                  height: 14,
                ),
                InvoiceItem(
                  label: "Total Price",
                  value: "\$${controller.totalPrice}",
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButtonWidget(
                  buttonText: "Back To Home",
                  destination: '/',
                  onPressedCallback: () {
                    controller.resetProduct();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
