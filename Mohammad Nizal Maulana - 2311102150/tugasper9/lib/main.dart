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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Data untuk ListView.builder dan ListView.separated
  final List<String> mahasiswa = [
    "Mohammad",
    "Nizal",
    "Maulana"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Widget Flutter"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= CONTAINER =================
              const Text(
                "1. Container",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Ini Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ================= GRIDVIEW =================
              const Text(
                "2. GridView",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 220,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(6, (index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Item ${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),

              // ================= LISTVIEW =================
              const Text(
                "3. ListView",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 150,
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("A"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("B"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("C"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= LISTVIEW.BUILDER =================
              const Text(
                "4. ListView.builder",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: mahasiswa.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text(mahasiswa[index]),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ================= LISTVIEW.SEPARATED =================
              const Text(
                "5. ListView.separated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 220,
                child: ListView.separated(
                  itemCount: mahasiswa.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(mahasiswa[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.black,
                      thickness: 1,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ================= STACK =================
              const Text(
                "6. Stack",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      color: Colors.yellow,
                    ),
                    const Text(
                      "STACK",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}