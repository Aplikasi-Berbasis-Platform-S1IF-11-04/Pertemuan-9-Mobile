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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Kombinasi Widget UI Flutter"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. CONTAINER (Kotak Berwarna)
                const SectionTitle(title: "1. Container"),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey)],
                ),
                child: const Center(
                  child: Text(
                    "Ini adalah Container", 
                    style: TextStyle(color: Colors.white), 
                  ),
                ),
              ),

                const SizedBox(height: 20),

                // 2. STACK (Tampilan Bertumpuk)
                const SectionTitle(title: "2. Stack"),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 150, height: 150, color: Colors.blue),
                    Container(width: 100, height: 100, color: Colors.red),
                    const Text("Stack Text", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 20),

                // 3. GRIDVIEW (Minimal 6 Item)
                const SectionTitle(title: "3. GridView (6 Items)"),
                GridView.count(
                  shrinkWrap: true, // Agar bisa masuk dalam SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(6, (index) {
                    return Container(
                      color: Colors.teal[100 * (index + 1)],
                      child: Center(child: Text("Grid ${index + 1}")),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                // 4. LISTVIEW (Statik: A, B, C)
                const SectionTitle(title: "4. ListView (Statik)"),
                SizedBox(
                  height: 150,
                  child: ListView(
                    children: const [
                      ListTile(leading: CircleAvatar(child: Text("A")), title: Text("Item A")),
                      ListTile(leading: CircleAvatar(child: Text("B")), title: Text("Item B")),
                      ListTile(leading: CircleAvatar(child: Text("C")), title: Text("Item C")),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 5. LISTVIEW.BUILDER (Data Array)
                const SectionTitle(title: "5. ListView.builder"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("Data dari Array Index ke-$index"),
                        subtitle: const Text("Generated via builder"),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // 6. LISTVIEW.SEPARATED (Dengan Garis Pembatas)
                const SectionTitle(title: "6. ListView.separated"),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => const Divider(color: Colors.black, thickness: 2),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item Terpisah $index"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget tambahan untuk judul tiap section agar rapi
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}