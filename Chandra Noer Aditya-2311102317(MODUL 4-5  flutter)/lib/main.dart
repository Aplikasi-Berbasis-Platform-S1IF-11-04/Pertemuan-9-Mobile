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
      title: 'Praktikum Modul 4-5 Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF4F6FB),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> buah = const [
    'Apel',
    'Jeruk',
    'Mangga',
    'Pisang',
    'Anggur',
  ];

  final List<String> menu = const [
    'Beranda',
    'Profil',
    'Pengaturan',
    'Bantuan',
    'Keluar',
  ];

  final List<IconData> iconGrid = const [
    Icons.home,
    Icons.person,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.star,
    Icons.settings,
  ];

  final List<Color> warnaGrid = const [
    Color(0xFF5B6CFF),
    Color(0xFF00B894),
    Color(0xFFFF7675),
    Color(0xFFFFB142),
    Color(0xFF6C5CE7),
    Color(0xFF0984E3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Modul 4-5'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(),

                const SizedBox(height: 20),
                sectionCard(title: '1. Container', child: containerWidget()),

                sectionCard(
                  title: '2. GridView Minimal 6 Item',
                  child: gridViewWidget(),
                ),

                sectionCard(
                  title: '3. ListView 3 Item A, B, C',
                  child: listViewABCWidget(),
                ),

                sectionCard(
                  title: '4. ListView.builder dari Data Array',
                  child: listViewBuilderWidget(),
                ),

                sectionCard(
                  title: '5. ListView.separated dengan Garis Pembatas',
                  child: listViewSeparatedWidget(),
                ),

                sectionCard(title: '6. Stack', child: stackWidget()),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B6CFF), Color(0xFF6C5CE7)],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tugas Praktikum Flutter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Modul 4-5: Container, GridView, ListView, Builder, Separated, dan Stack',
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [judulWidget(title), const SizedBox(height: 12), child],
      ),
    );
  }

  Widget judulWidget(String judul) {
    return Text(
      judul,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D3436),
      ),
    );
  }

  Widget containerWidget() {
    return Container(
      width: double.infinity,
      height: 115,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFB142), Color(0xFFFF7675)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.deepOrange, width: 2),
      ),
      child: const Text(
        'Ini adalah Container berwarna',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget gridViewWidget() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: warnaGrid[index],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: warnaGrid[index].withOpacity(0.35),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconGrid[index], color: Colors.white, size: 32),
              const SizedBox(height: 8),
              Text(
                'Item ${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listViewABCWidget() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Card(
          elevation: 1,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF5B6CFF),
              foregroundColor: Colors.white,
              child: Text('A'),
            ),
            title: Text('Item A'),
            subtitle: Text('Contoh data pertama pada ListView'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        Card(
          elevation: 1,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF00B894),
              foregroundColor: Colors.white,
              child: Text('B'),
            ),
            title: Text('Item B'),
            subtitle: Text('Contoh data kedua pada ListView'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
        Card(
          elevation: 1,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFF7675),
              foregroundColor: Colors.white,
              child: Text('C'),
            ),
            title: Text('Item C'),
            subtitle: Text('Contoh data ketiga pada ListView'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ],
    );
  }

  Widget listViewBuilderWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buah.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              foregroundColor: Colors.indigo,
              child: Text('${index + 1}'),
            ),
            title: Text(
              buah[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Data array ke-${index + 1}'),
            trailing: const Icon(Icons.local_grocery_store),
          ),
        );
      },
    );
  }

  Widget listViewSeparatedWidget() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.menu, color: Colors.indigo.shade400),
            title: Text(
              menu[index],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.chevron_right),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300,
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }

  Widget stackWidget() {
    return Center(
      child: SizedBox(
        width: 260,
        height: 240,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15,
              left: 20,
              child: Container(
                width: 190,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B6CFF),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 45,
              right: 15,
              child: Container(
                width: 180,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB142),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: Container(
                width: 170,
                height: 105,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7675),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Text(
                  'Stack Widget',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
