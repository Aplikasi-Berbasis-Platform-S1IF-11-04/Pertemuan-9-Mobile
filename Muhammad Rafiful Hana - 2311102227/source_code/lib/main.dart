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
      title: 'Aplikasi Coffee Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> menuItems = const [
    'Espresso',
    'Cappuccino',
    'Latte',
    'Mocha',
    'Americano',
  ];

  final List<String> orderStatus = const [
    'Pesanan Masuk',
    'Sedang Dibuat',
    'Siap Diambil',
  ];

  final List<Map<String, dynamic>> gridItems = const [
    {
      'title': 'Coffee',
      'icon': Icons.coffee,
      'color': Colors.brown,
    },
    {
      'title': 'Pastry',
      'icon': Icons.cake,
      'color': Colors.orange,
    },
    {
      'title': 'Smoothie',
      'icon': Icons.local_drink,
      'color': Colors.green,
    },
    {
      'title': 'Tea',
      'icon': Icons.emoji_nature,
      'color': Colors.teal,
    },
    {
      'title': 'Snacks',
      'icon': Icons.restaurant,
      'color': Colors.red,
    },
    {
      'title': 'History',
      'icon': Icons.history,
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f0eb),
      appBar: AppBar(
        title: const Text(
          'MODUL 4-5',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('1. Container'),
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown, Colors.brown.shade300],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.coffee,
                      color: Colors.white,
                      size: 38,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Muhammad Rafiful Hana",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2311102227',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            sectionTitle('2. GridView Kategori Menu'),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gridItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                final item = gridItems[index];

                return Container(
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: item['color'].withValues(alpha: 0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], size: 42, color: Colors.white),
                      const SizedBox(height: 10),
                      Text(
                        item['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            sectionTitle('3. ListView Status Pesanan'),
            SizedBox(
              height: 180,
              child: ListView(
                children: const [
                  CustomTile('Pesanan Masuk', Icons.receipt_long),
                  CustomTile('Sedang Dibuat', Icons.coffee_maker),
                  CustomTile('Siap Diambil', Icons.check_circle),
                ],
              ),
            ),

            sectionTitle('4. ListView.builder Daftar Menu'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        menuItems[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Minuman tersedia'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),

            sectionTitle('5. ListView.separated Daftar Minuman'),
            SizedBox(
              height: 230,
              child: ListView.separated(
                itemCount: menuItems.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1.2,
                  color: Colors.brown,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.coffee,
                      color: Colors.brown,
                    ),
                    title: Text('Menu: ${menuItems[index]}'),
                    subtitle: const Text('Nikmati sajian terbaik kami'),
                    trailing: const Icon(Icons.check, color: Colors.green),
                  );
                },
              ),
            ),

            sectionTitle('6. Stack Promo Coffee Shop'),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.coffee,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 95,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade300,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 28,
                    right: 24,
                    child: Text(
                      'Coffee Time',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomTile(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.brown),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Status pesanan'),
      ),
    );
  }
}