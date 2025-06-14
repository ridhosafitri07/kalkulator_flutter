import 'package:flutter/material.dart';
import '../models/history_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void _clearHistory() {
    setState(() {
      HistoryModel.historyList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat'),
        backgroundColor: Colors.deepPurple, // Warna header
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearHistory, // Hapus riwayat saat tombol ditekan
          ),
        ],
      ),
      body: HistoryModel.historyList.isEmpty
          ? const Center(
              child: Text(
                "Belum ada riwayat",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: HistoryModel.historyList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4, // Efek bayangan
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.deepPurple),
                    title: Text(
                      HistoryModel.historyList[index],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
