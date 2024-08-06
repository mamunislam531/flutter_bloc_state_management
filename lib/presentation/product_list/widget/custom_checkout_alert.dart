import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:limerick_flutter_task/presentation/common_widgets/custom_text.dart';

class CustomCheckoutAlert extends StatelessWidget {
  const CustomCheckoutAlert({
    super.key,
    required this.conFirmButton,
  });

  final VoidCallback conFirmButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm Checkout"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(text: "Text is the sdfv "),
                CustomTextWidget(text: "53.2"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.grey.shade300,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextWidget(text: "Total Amount :  ", fontColor: Colors.red),
                CustomTextWidget(text: " 522.00", fontColor: Colors.red),
              ],
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            log("message");
            Navigator.pop(context);
          },
          child: const Text("Edit"),
        ),
        TextButton(onPressed: conFirmButton, child: const Text("Confirm")),
      ],
    );
  }
}
