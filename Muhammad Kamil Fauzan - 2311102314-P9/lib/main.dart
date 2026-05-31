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
      title: 'Praktikum Modul 4-5',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> dataBuah = const [
    'Apel',
    'Jeruk',
    'Mangga',
    'Pisang',
    'Semangka',
  ];

  final List<String> dataHewan = const [
    'Kucing',
    'Anjing',
    'Burung',
    'Ikan',
    'Kelinci',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Modul 4-5 Flutter'),
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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Item ${index + 1}',
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
                      leading: Icon(Icons.looks_one),
                      title: Text('Item A'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.looks_two),
                      title: Text('Item B'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.looks_3),
                      title: Text('Item C'),
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
                itemCount: dataBuah.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.apple),
                      title: Text(dataBuah[index]),
                      subtitle: Text('Data buah ke-${index + 1}'),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle('5. ListView.separated dengan Garis Pembatas'),

            SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: dataHewan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text(dataHewan[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.grey, thickness: 1);
                },
              ),
            ),

            const SizedBox(height: 24),

            sectionTitle('6. Stack Tampilan Bertumpuk'),

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const Text(
                    'Ini Stack',
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
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
