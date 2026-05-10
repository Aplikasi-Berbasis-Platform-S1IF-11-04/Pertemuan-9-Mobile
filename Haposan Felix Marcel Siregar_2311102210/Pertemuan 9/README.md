<div style="font-family: 'Times New Roman', Times, serif;">

<div align="center">
  <br />

  <h1>LAPORAN PRAKTIKUM <br>
  APLIKASI BERBASIS PLATFORM
  </h1>

  <br />

  <h3>MODUL - 4, 5<br>
    Praktikum Widget dan Layout Flutter
  </h3>

  <br />

  <img width="250" alt="Logo Tel-U" src="SS/image1.png" />

  <br />
  <br />
  <br />

  <h3>Disusun Oleh :</h3>

  <p>
    <strong>Haposan Felix Marcel Siregar</strong><br>
    <strong>2311102210</strong><br>
    <strong>S1 IF-11-04</strong>
  </p>

  <br />

  <h3>Dosen Pengampu :</h3>

  <p>
    <strong>Cahyo Prihantoro, S.Kom., M.Eng.</strong>
  </p>
  
  <br />

  <h3>LABORATORIUM HIGH PERFORMANCE
  <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>
</div>

<hr>

## 1. Penjelasan Singkat Tiap Widget

Dalam pembuatan tampilan ini, digunakan berbagai jenis *Widget* yang disediakan oleh Flutter untuk menyusun tata letak (*layouting*), antara lain:

1. **Container** : Widget dasar yang sangat serbaguna. Digunakan untuk membungkus *child widget* agar dapat diberikan styling tambahan seperti warna (*color*), batas (*border*), lengkungan (*border radius*), bayangan (*box shadow*), *padding*, dan *margin*. Pada program ini digunakan untuk menampilkan kotak berwarna biru.
2. **GridView** : Widget yang digunakan untuk menampilkan sekumpulan item ke dalam format *grid* (baris dan kolom). Pada program ini, `GridView.count` digunakan untuk membuat 6 buah item grid yang saling berjejer.
3. **ListView** : Widget dasar untuk menampilkan daftar elemen secara linier (vertikal atau horizontal) yang bisa digulir (*scroll*). Digunakan pada program untuk menampilkan 3 item statis (A, B, C).
4. **ListView.builder** : Variasi dari `ListView` yang sangat efisien untuk data berjumlah besar atau dinamis karena item hanya dibangun (*build*) ketika muncul di layar (*lazy loading*). Pada program ini, widget menampilkan item yang datanya bersumber dari sebuah variabel array / list.
5. **ListView.separated** : Memiliki cara kerja seperti `ListView.builder`, dengan keunggulan memiliki atribut `separatorBuilder` untuk membuat pemisah (misalnya garis `Divider`) di antara setiap item secara otomatis.
6. **Stack** : Widget yang digunakan untuk menyusun berbagai *child widget* secara bertumpuk ke depan. Widget yang berada di awal deklarasi akan menjadi *background*, sedangkan widget terakhir akan berada di paling depan. Pada program ini digunakan untuk menumpuk sebuah kotak hijau, kotak kuning, dan teks secara sejajar.

---

## 2. Screenshot Hasil Tampilan

Berikut adalah hasil eksekusi program (UI) dari Modul 4-5 yang memuat seluruh widget tersebut:

<br>

<div align="center">
  <!-- Silakan ganti path di bawah ini dengan gambar screenshot sesungguhnya -->
  <img src="SS/screenshot_modul_4_5.png" width="400" alt="Screenshot Hasil Modul 4-5">
</div>

<br>

*(Catatan: Anda dapat menyimpan gambar screenshot aplikasi dengan nama `screenshot_modul_4_5.png` ke dalam folder `SS`)*

---

## 3. Source Code (lib/main.dart)

Di bawah ini merupakan implementasi kode program lengkap yang terletak di file `lib/main.dart`:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
```

</div>
