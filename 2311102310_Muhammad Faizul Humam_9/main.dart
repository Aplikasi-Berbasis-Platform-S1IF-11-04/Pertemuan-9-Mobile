import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum Modul 4-5',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TugasWidgetPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TugasWidgetPage extends StatelessWidget {
  const TugasWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy array untuk ListView.builder dan ListView.separated
    final List<String> dataMahasiswa = [
      'Muhammad Faizul Humam',
      'Muhammad Faizul',
      'Muhammad Humam',
      'Faizul Humam',
      'M. Faizul H.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eksplorasi Widget UI Flutter'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 1. WIDGET CONTAINER & STACK
            // ==========================================
            const Text(
              '1. Container & Stack',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                // Container sebagai latar belakang kotak berwarna
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Widget bertumpuk di dalam Stack
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black54,
                    child: const Text(
                      'Teks di Atas Container (Stack)',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // ==========================================
            // 2. WIDGET GRIDVIEW
            // ==========================================
            const Text(
              '2. GridView (Minimal 6 Item)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true, // Agar bisa menyatu di dalam SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3, // Menampilkan 3 kolom grid
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Grid ${index + 1}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
            const SizedBox(height: 25),

            // ==========================================
            // 3. WIDGET LISTVIEW (3 ITEM: A, B, C)
            // ==========================================
            const Text(
              '3. ListView Standar (Item A, B, C)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 140, // Membatasi tinggi ListView standar
              child: ListView(
                scrollDirection: Axis.horizontal, // Dibuat horizontal agar estetik
                children: [
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: const Text('Item A', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text('Item B', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 120,
                    color: Colors.deepOrange,
                    alignment: Alignment.center,
                    child: const Text('Item C', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // ==========================================
            // 4. WIDGET LISTVIEW.BUILDER
            // ==========================================
            const Text(
              '4. ListView.builder (Data Array)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataMahasiswa.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.indigo),
                    title: Text(dataMahasiswa[index]),
                    subtitle: Text('Indeks data ke-$index'),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),

            // ==========================================
            // 5. WIDGET LISTVIEW.SEPARATED
            // ==========================================
            const Text(
              '5. ListView.separated (List + Garis Pembatas)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataMahasiswa.length,
              // Menentukan bentuk item list
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '📍 Anggota: ${dataMahasiswa[index]}',
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              },
              // Menentukan bentuk garis pembatas (separator)
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.red,
                  thickness: 1.5,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}