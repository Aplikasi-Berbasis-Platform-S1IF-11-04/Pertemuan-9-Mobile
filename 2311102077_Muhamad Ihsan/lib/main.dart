import 'package:flutter/material.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo Widget Flutter",
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("Demo Komponen Flutter"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CONTAINER
              const SectionHeader(title: "1. Container Custom"),
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.indigo],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Container Modern",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // STACK
              const SectionHeader(title: "2. Stack Widget"),
              SizedBox(
                height: 170,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Icon(
                      Icons.flutter_dash,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // GRIDVIEW
              const SectionHeader(title: "3. Grid Menu"),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  List<IconData> icons = [
                    Icons.home,
                    Icons.person,
                    Icons.settings,
                    Icons.camera_alt,
                    Icons.favorite,
                    Icons.shopping_cart,
                  ];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[index].shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icons[index], size: 35, color: Colors.black87),
                  );
                },
              ),

              const SizedBox(height: 25),

              // LISTVIEW STATIK
              const SectionHeader(title: "4. Daftar Pengguna"),
              SizedBox(
                height: 180,
                child: ListView(
                  children: const [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text("Andi"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text("Budi"),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text("Citra"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // LISTVIEW BUILDER
              const SectionHeader(title: "5. Produk Builder"),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: Text("Produk ${index + 1}"),
                      subtitle: const Text("Data dibuat otomatis"),
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              // LISTVIEW SEPARATED
              const SectionHeader(title: "6. List Dengan Separator"),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.deepPurple, thickness: 1.5),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text("Tugas ${index + 1}"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
