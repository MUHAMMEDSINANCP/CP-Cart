// ignore_for_file: file_names

import 'package:cp_cart/Widgets/HomePage/BottomNavigationBar.dart';
import 'package:cp_cart/Widgets/HomePage/MyHomePageBody.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Image.asset("assets/images/hamburger.png"),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.all(10),
            child: Image.asset("assets/images/SEARCH.png"),
          ),
        ],
      ),
      body: const MyHomePageBody(),
      bottomNavigationBar: const MyHomeBottomNavBar(),
    );
  }
}
