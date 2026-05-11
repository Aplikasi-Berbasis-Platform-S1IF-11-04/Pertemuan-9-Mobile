import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Widget Flutter',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MenuUtama(),
    );
  }
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Array untuk ListView.builder
    final List<String> dataMahasiswa = ['Budi', 'Siti', 'Agus', 'Rina', 'Eko'];

    return Scaffold(
      appBar: AppBar(title: const Text("Tugas UI Widget")),
      // Kita pakai SingleChildScrollView agar semua widget bisa discroll kebawah
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. CONTAINER ---
            const Text(
              "1. Container (Kotak Berwarna)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black26),
              ),
              child: const Center(child: Text("Halo, saya Container")),
            ),
            const Divider(height: 30),

            // --- 2. GRIDVIEW (Minimal 6 Item) ---
            const Text(
              "2. GridView (6 Items)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3, // 3 kolom ke samping
              shrinkWrap: true, // Agar GridView mengikuti isi konten
              physics:
                  const NeverScrollableScrollPhysics(), // Mematikan scroll internal grid
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                6,
                (index) => Container(
                  color: Colors.teal[(index + 1) * 100],
                  child: Center(child: Text("Grid ${index + 1}")),
                ),
              ),
            ),
            const Divider(height: 30),

            // --- 3. LISTVIEW STATIC (A, B, C) ---
            const Text(
              "3. ListView (Static A, B, C)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.label), title: Text("Item A")),
                  ListTile(leading: Icon(Icons.label), title: Text("Item B")),
                  ListTile(leading: Icon(Icons.label), title: Text("Item C")),
                ],
              ),
            ),
            const Divider(height: 30),

            // --- 4. LISTVIEW.BUILDER (Dari Array) ---
            const Text(
              "4. ListView.builder (Dari Array)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataMahasiswa.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(dataMahasiswa[index]),
                    subtitle: Text("Mahasiswa ke-${index + 1}"),
                  ),
                );
              },
            ),
            const Divider(height: 30),

            // --- 5. LISTVIEW.SEPARATED (Dengan Garis) ---
            const Text(
              "5. ListView.separated (Garis Pembatas)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.blue),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text("List Separated Index: $index"),
              ),
            ),
            const Divider(height: 30),

            // --- 6. STACK (Tampilan Bertumpuk) ---
            const Text(
              "6. Stack (Bertumpuk)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(height: 150, width: 150, color: Colors.red),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 50,
                  child: Text(
                    "TUMPANG TINDIH",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
