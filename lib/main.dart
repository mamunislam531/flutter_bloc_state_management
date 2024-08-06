import 'package:flutter/material.dart';
import 'package:limerick_flutter_task/presentation/login/login.dart';
import 'package:limerick_flutter_task/presentation/product_list/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}
