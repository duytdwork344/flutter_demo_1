import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../badge/views/badge_view.dart';
import '../../fingerprint/views/fingerprint_view.dart';
import '../../notification/views/notification_view.dart';
import '../../profile/views/profile_view.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var currentPage = 0.obs;
  late PageController pageController;
  
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
  
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
  
  void changePage(int index) {
    currentIndex.value = index;
    
    switch (index) {
      case 0:
        // Trang Home - không cần điều hướng
        break;
      case 1:
        Get.to(() => const BadgeView());
        break;
      case 2:
        Get.to(() => const FingerprintView());
        break;
      case 3:
        Get.to(() => const NotificationView());
        break;
      case 4:
        Get.to(() => const ProfileView());
        break;
    }
  }
}