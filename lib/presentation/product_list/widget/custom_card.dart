import 'package:flutter/material.dart';
import 'package:limerick_flutter_task/presentation/common_widgets/custom_text.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                child: const FadeInImage(
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                  placeholder: AssetImage("assets/images/logo.png"),
                  image: NetworkImage("https://etimg.etb2bimg.com/photo/82427268.cms"),
                ),
              ),
              const TextField(
                textAlign: TextAlign.center,
                cursorHeight: 10,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, height: .95),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: 20,
                    maxWidth: 60,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Acme Test Slain",
                fontWeight: FontWeight.w500,
              ),
              CustomTextWidget(text: "This Slain Buy One Get One", fontColor: Colors.red, fontSize: 11),
              Row(
                children: [
                  CustomTextWidget(text: "৳ 5.35", fontColor: Colors.cyan, fontSize: 11),
                  SizedBox(width: 20),
                  CustomTextWidget(text: "||", fontSize: 11),
                  SizedBox(width: 20),
                  CustomTextWidget(text: "Stock 256", fontColor: Colors.cyan, fontSize: 11),
                ],
              ),
              Row(
                children: [
                  CustomTextWidget(text: "MRP ৳5.35", fontSize: 11),
                  CustomTextWidget(text: "||", fontSize: 11),
                  CustomTextWidget(text: "Master Pack: 100", fontSize: 11),
                ],
              ),
              CustomTextWidget(
                text: "Total: ৳785.5",
                fontSize: 11,
                fontColor: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
