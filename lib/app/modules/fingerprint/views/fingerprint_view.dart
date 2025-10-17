import 'package:flutter/material.dart';

class FingerprintView extends StatelessWidget {
  const FingerprintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Fingerprint Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}