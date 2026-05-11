import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Rows & Columns',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modul 5.3 - Strawberry Pavlova'),
          backgroundColor: Colors.redAccent,
        ),
        body: const Center(
          child: PavlovaRecipeCard(),
        ),
      ),
    );
  }
}

class PavlovaRecipeCard extends StatelessWidget {
  const PavlovaRecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. BAGIAN TEKS (JUDUL & DESKRIPSI)
    const titleText = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.5, fontSize: 24),
      ),
    );

    const subTitle = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
        'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
      ),
    );

    // 2. BAGIAN RATING (Row di dalam Container)
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500], size: 20),
        Icon(Icons.star, color: Colors.green[500], size: 20),
        Icon(Icons.star, color: Colors.green[500], size: 20),
        const Icon(Icons.star, color: Colors.black, size: 20),
        const Icon(Icons.star, color: Colors.black, size: 20),
      ],
    );

    final ratings = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    // 3. ICON LIST (3 Column di dalam 1 Row)
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 14,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    // 4. MENGGABUNGKAN SEMUA KONTEN KIRI (Ke dalam 1 Column)
    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    // 5. GAMBAR UTAMA (Sisi Kanan)
    final mainImage = Image.network(
      'https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=600&q=80',
      fit: BoxFit.cover,
    );

    // 6. LAYOUT AKHIR (Row Utama pembagi Kiri dan Kanan)
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Agar gambar memenuhi tinggi Card
          children: [
            Expanded(
              flex: 5, 
              child: SingleChildScrollView(child: leftColumn),
            ),
            Expanded(
              flex: 4,
              child: mainImage,
            ),
          ],
        ),
      ),
    );
  }
}