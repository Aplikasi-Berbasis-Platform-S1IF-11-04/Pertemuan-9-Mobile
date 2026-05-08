import 'package:flutter/material.dart';

void main() {
  runApp(const PraktikumModulApp());
}

class PraktikumModulApp extends StatelessWidget {
  const PraktikumModulApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum 4-5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF8F5FF),
        fontFamily: 'Roboto',
      ),
      home: const TugasScreen(),
    );
  }
}

class TugasScreen extends StatelessWidget {
  const TugasScreen({super.key});

  final List<String> arrayLayanan = const [
    "Premium Wash",
    "Express Cleaning",
    "Sneaker Whitening",
    "Leather Treatment",
  ];

  final List<String> arrayStatus = const [
    "Pesanan Masuk",
    "Proses Pembersihan",
    "Selesai & Bisa Diambil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget UI Modern"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 1. CONTAINER
            // ==========================================
            const JudulSection(judul: "1. Container"),
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Container Modern",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 2. STACK
            // ==========================================
            const JudulSection(judul: "2. Stack"),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange.shade100,
                    ),
                  ),

                  Positioned(
                    top: 25,
                    child: Container(
                      height: 110,
                      width: 260,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 8),
                        ],
                      ),
                    ),
                  ),

                  const Text(
                    "Widget Bertumpuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 3. GRIDVIEW
            // ==========================================
            const JudulSection(judul: "3. GridView"),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: List.generate(6, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      "Menu ${index + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 4. LISTVIEW STATIS
            // ==========================================
            const JudulSection(judul: "4. ListView Statis"),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text("A", style: TextStyle(color: Colors.white)),
                    ),
                    title: Text("Data Produk A"),
                    subtitle: Text("Deskripsi item pertama"),
                  ),

                  Divider(),

                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text("B", style: TextStyle(color: Colors.white)),
                    ),
                    title: Text("Data Produk B"),
                    subtitle: Text("Deskripsi item kedua"),
                  ),

                  Divider(),

                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text("C", style: TextStyle(color: Colors.white)),
                    ),
                    title: Text("Data Produk C"),
                    subtitle: Text("Deskripsi item ketiga"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 5. LISTVIEW BUILDER
            // ==========================================
            const JudulSection(judul: "5. ListView.builder"),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: arrayLayanan.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_laundry_service,
                      color: Colors.deepPurple,
                    ),
                    title: Text(arrayLayanan[index]),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // ==========================================
            // 6. LISTVIEW SEPARATED
            // ==========================================
            const JudulSection(judul: "6. ListView.separated"),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: arrayStatus.length,

                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.deepPurple,
                    thickness: 1.2,
                  );
                },

                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                    title: Text(arrayStatus[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class JudulSection extends StatelessWidget {
  final String judul;

  const JudulSection({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        judul,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
