import 'package:flutter/material.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    this.buttonWidth, this.buttonHeight, this.buttonColor,
  });
  final double? buttonWidth;
    final double? buttonHeight;
   final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(color: buttonColor ?? Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SizedBox(
          height: buttonHeight ?? 20,
          width: buttonWidth ?? MediaQuery.sizeOf(context).width,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
