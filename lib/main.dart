import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/home/controllers/home_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HiStaff",
      home: const HomeView(),
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
  );
}