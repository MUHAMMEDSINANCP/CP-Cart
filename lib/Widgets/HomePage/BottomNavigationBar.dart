// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyHomeBottomNavBar extends StatelessWidget {
  const MyHomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.grey, spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildContainerBottomNav(Icons.person),
            buildContainerBottomNav(Icons.shopping_bag),
            buildContainerBottomNav(Icons.home, isSelected: true),
            buildContainerBottomNav(Icons.favorite),
            buildContainerBottomNav(Icons.settings),
          ],
        ),
      ),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.pink[100] : Colors.white,
        shape: BoxShape.circle,
        boxShadow: isSelected
            ? [
                const BoxShadow(
                    color: Colors.grey, blurRadius: 10, spreadRadius: 1)
              ]
            : [],
      ),
      height: 50,
      width: 50,
      child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
    );
  }
}
