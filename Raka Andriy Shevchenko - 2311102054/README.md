<div align="center">
  <br />

  <h1>LAPORAN PRAKTIKUM <br>
  APLIKASI BERBASIS PLATFORM
  </h1>

  <br />

  <h3>MODUL - 4 & 5<br>
    Antar Muka Pengguna
  </h3>

  <br />

  <!-- Ganti path logo sesuai file kamu, atau hapus baris ini jika tidak ada logo -->
  <!-- <img src="assets/logo.jpeg" alt="logo" width="300"> -->

  <br />
  <br />

  <h3>Disusun Oleh :</h3>

  <p>
    <strong>Raka Andriy Shevchenko</strong><br>
    <strong>2311102054</strong><br>
    <strong>IF - 11 - 04</strong>
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

---

# 1. Tugas

📝 Tugas Praktikum Modul 4-5 Flutter

Buat 1 project Flutter yang menampilkan beberapa widget UI berikut:  
🔹 Yang harus ada:  
Container → kotak berwarna  
GridView → minimal 6 item (grid)  
ListView → 3 item (A, B, C)  
ListView.builder → list dari data array  
ListView.separated → list + garis pembatas  
Stack → tampilan bertumpuk (kotak / text)  

📦 Output yang dikumpulkan:
- Screenshot hasilnya
- Source code
- Penjelasan singkat tiap widget

---

# 2. Source Code main.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4-5 Flutter',
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: const HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  final List<String> buahList = const ['Apel', 'Pisang', 'Jeruk', 'Manga', 'Anggur'];
  final List<String> namaList = const ['Raka', 'Alpin', 'Asbi', 'Isan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul 4-5 Widgets - Raka'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 1. CONTAINER
            const Text('1. Container', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text('Ini Container!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. GRIDVIEW
            const Text('2. GridView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(6, (i) {
                final colors = [
                  Colors.blue, Colors.indigo, Colors.cyan,
                  Colors.teal, Colors.lightBlue, Colors.blueAccent,
                ];
                return Container(
                  decoration: BoxDecoration(
                    color: colors[i],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text('Item ${i + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // 3. LISTVIEW STATIS
            const Text('3. ListView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.label, color: Colors.orange), title: Text('Item A')),
                  ListTile(leading: Icon(Icons.label, color: Colors.orange), title: Text('Item B')),
                  ListTile(leading: Icon(Icons.label, color: Colors.orange), title: Text('Item C')),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. LISTVIEW.BUILDER
            const Text('4. ListView.builder', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: buahList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.circle, color: Colors.orange, size: 14),
                    title: Text(buahList[index]),
                    subtitle: Text('Indeks: $index'),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 5. LISTVIEW.SEPARATED
            const Text('5. ListView.separated', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: namaList.length,
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.purple, thickness: 1.5, indent: 16, endIndent: 16);
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[100],
                      child: Text(namaList[index][0], style: const TextStyle(color: Colors.purple)),
                    ),
                    title: Text(namaList[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 6. STACK
            const Text('6. Stack (bertumpuk)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                width: 250,
                height: 140,
                child: Stack(
                  children: [
                    Container(
                      width: 220,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 220,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Stack!\nBertumpuk',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
```

---

# 3. Penjelasan Code

Aplikasi ini merupakan implementasi antarmuka pengguna (UI) Flutter yang mendemonstrasikan enam widget tata letak fundamental secara berurutan dalam satu halaman. Seluruh widget dibungkus menggunakan `SingleChildScrollView` agar layar dapat digulir dan tidak mengalami overflow. Data yang digunakan bersifat immutable (`const List`) untuk menjaga keamanan data dari modifikasi yang tidak disengaja.

---

# 4. Screenshot Hasil Running dan Penjelasan Widget

## 1. Container

<!-- Ganti path gambar sesuai file screenshot kamu di folder SS/ -->
<p align="center">
  <img src="SS/Modul_4-5-1.png" width="300" alt="Tampilan Container">
</p>

**Penjelasan:** `Container` adalah widget pembungkus dasar yang dapat dikustomisasi ukuran (width, height), warna latar belakang melalui `BoxDecoration`, serta sudut melengkung menggunakan `borderRadius`. Widget ini berfungsi sebagai blok bangunan utama untuk membuat elemen kotak berwarna pada antarmuka pengguna.

---

## 2. GridView

<p align="center">
  <img src="SS/Modul_4-5-1.png" width="300" alt="Tampilan GridView">
</p>

**Penjelasan:** `GridView.count` digunakan untuk menampilkan item dalam format matriks dua dimensi dengan jumlah kolom tetap (`crossAxisCount: 3`). Atribut `shrinkWrap: true` dan `physics: NeverScrollableScrollPhysics()` wajib ditambahkan agar GridView tidak berkonflik dengan scroll induknya (Column + SingleChildScrollView).

---

## 3. ListView

<p align="center">
  <img src="SS/Modul_4-5-1.png" width="300" alt="Tampilan ListView">
</p>

**Penjelasan:** `ListView` statis merender seluruh widget child-nya secara langsung ke memori sekaligus. Pendekatan ini cocok hanya untuk dataset kecil dengan jumlah item yang sudah pasti dan terbatas, seperti tiga item tetap (A, B, C) pada praktikum ini.

---

## 4. ListView.builder

<p align="center">
  <img src="SS/Modul_4-5-2.png" width="300" alt="Tampilan ListView.builder">
</p>

**Penjelasan:** `ListView.builder` adalah standar terbaik untuk merender daftar dari data array yang bersifat dinamis. Widget ini menggunakan sistem *lazy-loading*, yaitu item UI hanya dirender saat benar-benar terlihat di layar, sehingga lebih hemat memori dibandingkan `ListView` biasa untuk data berukuran besar.

---

## 5. ListView.separated

<p align="center">
  <img src="SS/Modul_4-5-2.png" width="300" alt="Tampilan ListView.separated">
</p>

**Penjelasan:** `ListView.separated` memiliki performa yang sama dengan `ListView.builder`, namun dilengkapi parameter `separatorBuilder` yang secara otomatis menyisipkan widget pemisah (dalam hal ini `Divider`) di antara setiap item daftar, sehingga tampilan lebih terstruktur dan mudah dibaca.

---

## 6. Stack

<p align="center">
  <img src="SS/Modul_4-5-2.png" width="300" alt="Tampilan Stack">
</p>

**Penjelasan:** `Stack` memungkinkan widget ditumpuk satu di atas yang lain pada sumbu-Z. Widget `Positioned` digunakan untuk mengatur posisi relatif setiap layer di dalam Stack. Pada praktikum ini, dua buah `Container` ditumpuk dengan offset tertentu menggunakan `Positioned`, menciptakan efek kedalaman visual.