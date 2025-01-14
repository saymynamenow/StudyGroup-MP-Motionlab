import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';
import 'package:motion_week2_sg/widgets/custom_button_widget.dart';

class cart extends StatelessWidget {
  final cartController = Get.put(CartController());
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
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Center(child: Text("My Cart")),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartProducts[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          product.image,
                          height: 96,
                          width: 96,
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${product.price.toStringAsFixed(2)}",
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
                                        IconButton(
                                          onPressed: () => cartController
                                              .quanitityDecrement(index),
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 15,
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        Text(
                                          "${cartController.quantities[index]}",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => cartController
                                              .quantityIncrement(index),
                                          icon: const Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                          padding: EdgeInsets.zero,
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
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Total: \$${cartController.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const CustomButtonWidget(
                    buttonText: "Buy Now",
                    destination: '/transaction',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
