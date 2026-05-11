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
          title: const Text('Stack Example'),
        ),
        body: Center( // Menengahkan posisi Stack di dalam layar
          // Ini adalah kode Stack milikmu
          child: SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: AlignmentDirectional.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.white.withAlpha(0),
                      Colors.black12,
                      Colors.black45
                    ],
                  ),
                ),
                child: const Text(
                  'Foreground Text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      ),
    );
  }
}