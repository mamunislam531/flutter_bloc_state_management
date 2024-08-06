import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.searchButton});

  final Function(String) searchButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
      height: 100,
      width: 500,
      child: SafeArea(
        child: TextField(
          onChanged: searchButton,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.grey)),
            prefixIcon: const Icon(Icons.search),
            labelText: "Search here",
            labelStyle: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarAction {
  final String title;
  final VoidCallback onTap;

  CustomAppBarAction({required this.title, required this.onTap});
}
