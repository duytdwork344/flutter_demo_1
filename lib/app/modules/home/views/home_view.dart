import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../../registration/views/registration_view.dart';
import '../../approval/views/approval_view.dart';
import '../../salary/views/salary_view.dart';
import '../../menu_detail/views/menu_detail_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: Stack(
      children: [
      Column(
      children: [
        _buildHeader(), // 👈 không bị padding của scroll view
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                _buildBanner(),
                const SizedBox(height: 16),
                _buildMenuGrid(),
              ],
            ),
          ),
        ),
      ],
    ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Obx(() => _buildBottomBar(controller)),

              /// 🔥 Nút fingerprint đè lên thanh bar
              Positioned(
                top: -25, // 👈 điều chỉnh cao thấp
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => controller.changePage(2),
                    child: Obx(() => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: controller.currentIndex.value == 2 ? 70 : 80,
                      height: controller.currentIndex.value == 2 ? 70 : 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orange.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 32,
                          child: const Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget _buildHeader(){
    final now = DateTime.now();
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      /*
       return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      */

      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.blue,
              size: 40,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${now.day}/${now.month}/${now.year}",
                style: GoogleFonts.inter(fontSize: 14, color: Colors.white70)
              ),
              Text(
                "15/11 Giáp Thìn",
                style: GoogleFonts.inter(fontSize: 12, color: Colors.white60)
              ),
              Text(
                "Xin chào ABC",
                style: GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00A8E8), Color(0xFF002B5B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tổng quan",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Tổng quan về các thông tin cần thiết",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    final menus = [
      {'icon': Icons.how_to_reg, 'label': 'Đăng ký', 'color': Colors.blue},
      {'icon': Icons.class_outlined, 'label': 'Phê duyệt', 'color': Colors.orange},
      {'icon': Icons.calendar_today_outlined, 'label': 'Công lương', 'color': Colors.green},
      {'icon': Icons.newspaper, 'label': 'Tin tức', 'color': Colors.red},
      {'icon': Icons.speed, 'label': 'Dashboard', 'color': Colors.red},
      {'icon': Icons.question_answer, 'label': 'Khảo sát', 'color': Colors.green},
      {'icon': Icons.star, 'label': 'Đảng viên', 'color': Colors.yellow},
      {'icon': Icons.person_add, 'label': 'Tuyển dụng', 'color': Colors.blue},
      {'icon': Icons.pie_chart, 'label': 'Báo cáo', 'color': Colors.blue},
      {'icon': Icons.person, 'label': 'PD HSNV', 'color': Colors.orange},
      {'icon': Icons.filter_9_plus, 'label': 'P.Thu Nhập', 'color': Colors.green},
      {'icon': Icons.task, 'label': 'Công Việc', 'color': Colors.red},
      {'icon': Icons.group, 'label': 'My Team', 'color': Colors.blue},
      {'icon': Icons.health_and_safety, 'label': 'Bảo Hiểm', 'color': Colors.orange},
      {'icon': Icons.person, 'label': 'DNTT', 'color': Colors.green},
      {'icon': Icons.cloud, 'label': 'Cloud', 'color': Colors.blue},
      {'icon': Icons.person, 'label': 'Thêm x001', 'color': Colors.black},
      {'icon': Icons.person, 'label': 'Thêm x002', 'color': Colors.yellow},
      {'icon': Icons.person, 'label': 'Thêm x003', 'color': Colors.red},
      {'icon': Icons.person, 'label': 'Thêm x004', 'color': Colors.orange},
    ];

    const itemsPerPage = 12;
    final totalPages = (menus.length / itemsPerPage).ceil();

    return Column(
      children: [
        SizedBox(
          height: 370,
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) => controller.currentPage.value = index,
            itemCount: totalPages,
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * itemsPerPage;
              final endIndex = (startIndex + itemsPerPage).clamp(0, menus.length);
              final pageMenus = menus.sublist(startIndex, endIndex);
              
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: pageMenus.length,
                itemBuilder: (context, index) {
                  final menu = pageMenus[index];
                  return _buildMenuItem(menu['icon'] as IconData, menu['label'] as String, menu['color'] as Color,
                  () => controller.onMenuTap(menu['label'] as String)
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalPages, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.currentPage.value == index ? Colors.blue : Colors.grey[300],
              ),
            );
          }),
        )),
      ],
    );
  }
  
  Widget _buildMenuItem(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }



  Widget _buildBottomBar(HomeController controller) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.badge_outlined), label: ''),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''), // 👈 để trống chỗ giữa
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
