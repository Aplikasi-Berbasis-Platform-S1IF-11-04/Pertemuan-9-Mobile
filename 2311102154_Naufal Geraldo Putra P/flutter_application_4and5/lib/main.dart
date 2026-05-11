import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(title: 'Modul 4 dan 5 - Pertemuan 9'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexNow = 0;
  void _onItemTapped(int index) {
    setState(() {
      _indexNow = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dataBuilder = [
      {'text': 'Naufal', 'color': Colors.amber},
      {'text': 'Geraldo', 'color': Colors.indigoAccent},
      {'text': 'Putra', 'color': Colors.red},
      {'text': 'Pramudianartono', 'color': Colors.greenAccent},
    ];
    final List<Widget> screens = [
      GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.indigoAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.redAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.lightGreenAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.deepOrange),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.pink),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.tealAccent),
          ),
        ],
      ),
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100, 
              color: Colors.blue,
              child: const Center(
                child: Text('A', style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100, 
              color: Colors.red,
              child: const Center(
                child: Text('B', style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100, 
              color: Colors.green,
              child: const Center(
                child: Text('C', style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
        ],
      ),
      ListView.builder(
        itemCount: dataBuilder.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 100, 
              color: dataBuilder[index]['color'],
              child: Center(
                child: Text(dataBuilder[index]['text'],
                 style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          );
        },
      ),
      ListView.separated(
        itemCount: dataBuilder.length,
        separatorBuilder: (context, index) => const Divider(thickness: 8 , color: Colors.black),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 100,
              color: dataBuilder[index]['color'],
              child: Center(
                child: Text(dataBuilder[index]['text'],
                style: TextStyle(fontSize: 30),
                ),
              ),
            )
          );
        },
      ),
      Stack(
        children: [
          Container(color: Colors.amberAccent, height: 300, width: 300),
          Container(
            height: 100, 
            width: 100, 
            color: Colors.indigo,
            child: Center(
              child: Text('Test',
              style: TextStyle(fontSize: 30),
              )
            ),
          ),
        ],
      )
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: screens[_indexNow],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNow,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: 'Grid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'List Build',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'List Seperated',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Stack',
          ),
        ],
      ),
    );
  }
}


