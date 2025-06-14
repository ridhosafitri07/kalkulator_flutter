import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key}); // Menggunakan super parameter untuk key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih sesuai tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[100], // Warna ungu muda untuk avatar
              ),
              child: const Icon(
                Icons.person, 
                size: 100, 
                color: Color.fromARGB(255, 106, 92, 109), // Warna ikon ungu
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "ridho fftrde",
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: Colors.purple, // Warna teks utama ungu
              ),
            ),
          ],
        ),
      ),
    );
  }
}
