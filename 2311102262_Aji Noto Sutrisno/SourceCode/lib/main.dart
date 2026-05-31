import 'package:flutter/material.dart';

void main() {
  runApp(const PraktikumApp());
}

class PraktikumApp extends StatelessWidget {
  const PraktikumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Widget Flutter',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> dataMinuman = const [
    'Kopi',
    'Teh',
    'Jus Jeruk',
    'Susu',
    'Cokelat',
  ];

  final List<String> dataKendaraan = const [
    'Mobil',
    'Motor',
    'Sepeda',
    'Bus',
    'Kereta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Widget Flutter- 2311102262 - Aji Noto Sutrisno'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('1. Container'),

            Container(
              width: double.infinity,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Selamat Datang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle('2. GridView'),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Menu ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            sectionTitle('3. ListView'),

            SizedBox(
              height: 160,
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Pilihan A'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('Pilihan B'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.thumb_up),
                      title: Text('Pilihan C'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle('4. ListView.builder'),

            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: dataMinuman.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.local_cafe),
                      title: Text(dataMinuman[index]),
                      subtitle: Text('Minuman ke-${index + 1}'),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle('5. ListView.separated'),

            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: dataKendaraan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.directions_car),
                    title: Text(dataKendaraan[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.deepPurple,
                    thickness: 1,
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle('6. Stack'),

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const Text(
                    'Flutter UI',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }
}