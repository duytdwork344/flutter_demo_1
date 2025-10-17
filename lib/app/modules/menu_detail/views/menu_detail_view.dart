import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDetailView extends StatelessWidget {
  const MenuDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final String menuName = Get.arguments ?? 'Menu';
    
    return Scaffold(
      appBar: AppBar(
        title: Text(menuName),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apps,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              menuName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Phát triển sau',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}