import 'package:flutter/material.dart';
import 'package:limerick_flutter_task/presentation/common_widgets/custom_button.dart';
import 'package:limerick_flutter_task/presentation/common_widgets/custom_text.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.button,
  });
  final VoidCallback button;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Colors.green,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTextWidget(text: "Total 1520.00", fontColor: Colors.white),
          CustomButton(text: "Order Now", buttonColor: Colors.orange, onTap: button)
        ],
      ),
    );
  }
}
