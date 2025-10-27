import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.calendar_month, 'color': Colors.blue, 'title': 'Đăng ký nghỉ'},
      {'icon': Icons.access_time, 'color': Colors.orange, 'title': 'Làm thêm giờ'},
      {'icon': Icons.assignment_add, 'color': Colors.green, 'title': 'Đăng ký giải trình'},
      {'icon': Icons.history, 'color': Colors.red, 'title': 'Lịch sử đăng ký'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A8E8),
        elevation: 0,
        titleSpacing: 0,
        title: const Text("Đăng ký", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ), 
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: item['color'] as Color,
                  size: 26,
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.black54),
              onTap: (){
                // chuyển tới màn cụ thể nào đó ở đây.  
              },
            ),
          );
        },
      ),
    );
  }
}