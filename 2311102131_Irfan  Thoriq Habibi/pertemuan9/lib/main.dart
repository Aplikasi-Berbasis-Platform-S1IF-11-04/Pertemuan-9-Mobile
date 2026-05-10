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
      title: 'Demo Widget Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Data array
    List<String> nama = [
      "Irfan",
      "Thoriq",
      "Habibi"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Widget Flutter"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),

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

              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,

                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Text(
                  "Ini adalah Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              // ================= GRIDVIEW =================
              const Text(
                "2. GridView",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 250,

                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

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

              SizedBox(
                height: 150,

                child: ListView(
                  children: const [

                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("A"),
                    ),

                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("B"),
                    ),

                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("C"),
                    ),
                  ],
                ),
              ),

              // ============== LISTVIEW.BUILDER ==============
              const Text(
                "4. ListView.builder",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 220,

                child: ListView.builder(
                  itemCount: nama.length,

                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(nama[index]),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ============ LISTVIEW.SEPARATED ============
              const Text(
                "5. ListView.separated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 220,

                child: ListView.separated(
                  itemCount: nama.length,

                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.black,
                      thickness: 1,
                    );
                  },

                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(nama[index]),
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
                      width: 120,
                      height: 120,
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

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}