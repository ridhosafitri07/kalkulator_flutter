import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final void Function(String) onPressed;

  const CalculatorButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool isOperator = "/x-+=⌫".contains(text); // Cek apakah tombol operator

    return GestureDetector(
      onTapDown: (_) {}, // Efek animasi saat ditekan
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isOperator ? Colors.orangeAccent : Colors.grey[850], // Warna tombol
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 5,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => onPressed(text),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), // Tombol bulat
            padding: const EdgeInsets.all(15),
            backgroundColor: isOperator ? Colors.orangeAccent : Colors.grey[850], // Warna
            shadowColor: Colors.black, // Bayangan
            elevation: 5, // Efek 3D
            textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isOperator ? Colors.black : Colors.white, // Warna teks
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
