import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';
import 'package:motion_week2_sg/controller/transaction_controller.dart';
import 'package:motion_week2_sg/widgets/custom_button_widget.dart';

class cart extends StatelessWidget {
  final cartController = Get.put(CartController());
  final transController = Get.put(TransactionController());
  cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Center(child: Text("My Cart")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 42,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/cart1.png",
                      height: 96,
                      width: 96,
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 161,
                            child: Text(
                              "Mi Band 8 Pro - Brand New",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$54.00",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: const Color(0xff00623B)),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                height: 35,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xff00623B),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                        onPressed:
                                            cartController.quantityDecrement,
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 15,
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Text(
                                      "${cartController.quantity}",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                        onPressed:
                                            cartController.quantityIncrement,
                                        icon: const Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/cart2.png",
                      height: 96,
                      width: 96,
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 161,
                            child: Text(
                              "Lycra Men's Shirt",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$54.00",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: const Color(0xff00623B)),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                height: 35,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xff00623B),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                        onPressed:
                                            cartController.quantityDecrement2,
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 15,
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    Text(
                                      "${cartController.quantityCart2}",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                        onPressed:
                                            cartController.quantityIncrement2,
                                        icon: const Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 460,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomButtonWidget(
                buttonText: "Buy Now",
                destination: '/transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
