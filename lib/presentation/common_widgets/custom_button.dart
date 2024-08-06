import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap, this.buttonWidth, this.buttonHeight, this.textSize, this.buttonColor});
  final String text;
  final VoidCallback onTap;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? textSize;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(color: buttonColor ?? Colors.blue, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SizedBox(
            height: buttonHeight ?? 20,
            width: buttonWidth ?? MediaQuery.sizeOf(context).width,
            child: Center(
              child: CustomTextWidget(
                text: text,
                fontSize: textSize ?? 16,
                fontWeight: FontWeight.w500,
                fontColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
