import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4-5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetDemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetDemoPage extends StatelessWidget {
  const WidgetDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data array untuk ListView.builder dan ListView.separated
    final List<String> dataArray = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Modul 4-5 Flutter'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: '1. Container'),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))
                ]
              ),
              alignment: Alignment.center,
              child: const Text('Ini adalah Container Berwarna', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),

            const SectionTitle(title: '2. GridView (Minimal 6 Item)'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(6, (index) {
                return Container(
                  color: Colors.orange[(index % 9 + 1) * 100],
                  alignment: Alignment.center,
                  child: Text('Grid ${index + 1}'),
                );
              }),
            ),
            const SizedBox(height: 20),

            const SectionTitle(title: '3. ListView (3 Item)'),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
              ),
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.label, color: Colors.red), title: Text('Item A')),
                  ListTile(leading: Icon(Icons.label, color: Colors.green), title: Text('Item B')),
                  ListTile(leading: Icon(Icons.label, color: Colors.blue), title: Text('Item C')),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const SectionTitle(title: '4. ListView.builder'),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
              ),
              child: ListView.builder(
                itemCount: dataArray.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.list_alt),
                      title: Text(dataArray[index]),
                      subtitle: const Text('Di-generate dari data array'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            const SectionTitle(title: '5. ListView.separated'),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
              ),
              child: ListView.separated(
                itemCount: dataArray.length,
                separatorBuilder: (context, index) => const Divider(color: Colors.red, thickness: 2),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.arrow_right),
                    title: Text('Separated ${dataArray[index]}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            const SectionTitle(title: '6. Stack'),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200, 
                    height: 200, 
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(16)),
                  ),
                  Container(
                    width: 150, 
                    height: 150, 
                    decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(16)),
                  ),
                  const Text('Teks Bertumpuk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}
