<h3 align="center">LAPORAN PRAKTIKUM</h3>
<h3 align="center">APLIKASI BERBASIS PLATFORM</h3>
<h3 align="center">MODUL 4 - 5</h3>

<br>
<p align="center">
  <img src="Screenshot Output_2311102069/logo telkom university.png" width="150"/>
</p>
<br>

<p align="center">
Disusun oleh:
<br><br>
D’SHARLENDITA FEBIANDA AURELIA  
<br>
2311102069  
<br>
S1 IF-11-04  
</p>

<br>

<p align="center">
Dosen Pengampu:
<br>
Cahyo Prihantoro, S.Kom., M.Eng  
</p>

<br><br>

<p align="center">
PROGRAM STUDI S1 INFORMATIKA  
<br>
FAKULTAS INFORMATIKA  
<br>
TELKOM UNIVERSITY PURWOKERTO  
<br>
2026  
</p>

---

## UNGUIDED
Membuat 1 project Flutter yang menampilkan beberapa widget UI dasar menggunakan bahasa pemrograman Dart dan framework Flutter. Pada project ini, aplikasi harus menampilkan beberapa komponen antarmuka seperti Container, GridView, ListView, ListView.builder, ListView.separated, dan Stack.

## SOURCE CODE
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
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Laundry',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> layananLaundry = const [
    'Cuci Reguler',
    'Cuci Express',
    'Cuci Setrika',
    'Dry Cleaning',
    'Setrika Saja',
  ];

  final List<String> prosesLaundry = const [
    'Pakaian Masuk',
    'Sedang Dicuci',
    'Siap Diambil',
  ];

  final List<Map<String, dynamic>> gridItems = const [
    {
      'title': 'Cuci',
      'icon': Icons.local_laundry_service,
      'color': Colors.blue,
    },
    {
      'title': 'Setrika',
      'icon': Icons.iron,
      'color': Colors.orange,
    },
    {
      'title': 'Express',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Delivery',
      'icon': Icons.delivery_dining,
      'color': Colors.green,
    },
    {
      'title': 'Parfum',
      'icon': Icons.local_florist,
      'color': Colors.pink,
    },
    {
      'title': 'Riwayat',
      'icon': Icons.history,
      'color': Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef7ff),
      appBar: AppBar(
        title: const Text(
          'MODUL 4-5',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
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
                      Icons.local_laundry_service,
                      color: Colors.white,
                      size: 38,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "D'sharlendita Febianda Aurelia",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2311102069',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            sectionTitle('2. GridView Layanan Laundry'),
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
                        color: item['color'].withOpacity(0.35),
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

            sectionTitle('3. ListView Proses Laundry'),
            SizedBox(
              height: 180,
              child: ListView(
                children: const [
                  CustomTile('Pakaian Masuk', Icons.inventory_2),
                  CustomTile('Sedang Dicuci', Icons.local_laundry_service),
                  CustomTile('Siap Diambil', Icons.check_circle),
                ],
              ),
            ),

            sectionTitle('4. ListView.builder Paket Laundry'),
            SizedBox(
              height: 260,
              child: ListView.builder(
                itemCount: layananLaundry.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        layananLaundry[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Layanan laundry tersedia'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),

            sectionTitle('5. ListView.separated Daftar Layanan'),
            SizedBox(
              height: 230,
              child: ListView.separated(
                itemCount: layananLaundry.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1.2,
                  color: Colors.blue,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.water_drop,
                      color: Colors.lightBlue,
                    ),
                    title: Text('Layanan: ${layananLaundry[index]}'),
                    subtitle: const Text('Bersih, rapi, dan wangi'),
                    trailing: const Icon(Icons.check, color: Colors.green),
                  );
                },
              ),
            ),

            sectionTitle('6. Stack Promo Laundry'),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
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
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.local_laundry_service,
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
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.bubble_chart,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 28,
                    right: 24,
                    child: Text(
                      'Clean & Fresh',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
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
          color: Colors.blue,
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
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Status proses laundry'),
      ),
    );
  }
}
```
Source code tersebut membuat aplikasi Flutter bertema layanan laundry. Program dimulai dari fungsi main() yang menjalankan class MyApp. Di dalam MyApp, digunakan MaterialApp sebagai kerangka utama aplikasi, lalu halaman awalnya diarahkan ke HomePage. Pada bagian ini juga terdapat pengaturan tema warna biru dan tulisan debug banner dihilangkan agar tampilan aplikasi terlihat lebih rapi.

## PENJELASAN SOURCE CODE

#### 1. Fungsi `main()` dan `MaterialApp`

Source code dimulai dari fungsi `main()` yang berfungsi menjalankan aplikasi Flutter melalui class `MyApp`. Pada class ini digunakan `MaterialApp` sebagai kerangka utama aplikasi. Selain itu, terdapat pengaturan tema warna biru menggunakan `ThemeData` serta `debugShowCheckedModeBanner: false` untuk menghilangkan tulisan debug pada pojok aplikasi agar tampilan lebih rapi.

Contoh code:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Laundry',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}
```

Penjelasan code:

* `runApp()` digunakan untuk menjalankan aplikasi Flutter.
* `MaterialApp` berfungsi sebagai kerangka dasar aplikasi.
* `title` digunakan untuk memberi nama aplikasi.
* `ThemeData` digunakan untuk mengatur tema aplikasi.
* `home: const HomePage()` digunakan untuk menentukan halaman utama aplikasi.

---

#### 2. Data List pada `HomePage`

Pada class `HomePage`, terdapat beberapa list seperti `layananLaundry` dan `prosesLaundry`. Data tersebut digunakan untuk menyimpan daftar layanan laundry dan proses laundry sehingga lebih mudah ditampilkan ke dalam widget seperti ListView dan GridView.

Contoh code:

```dart id="y1xq1r"
final List<String> layananLaundry = const [
  'Cuci Reguler',
  'Cuci Express',
  'Cuci Setrika',
  'Dry Cleaning',
  'Setrika Saja',
];

final List<String> prosesLaundry = const [
  'Pakaian Masuk',
  'Sedang Dicuci',
  'Siap Diambil',
];
```

Penjelasan code:

* `List<String>` digunakan untuk menyimpan data bertipe teks.
* `const` digunakan agar data bersifat tetap.
* Data list digunakan untuk mengisi tampilan widget secara otomatis.

---

#### 3. `Scaffold` dan `SingleChildScrollView`

Tampilan utama aplikasi menggunakan `Scaffold` yang berisi `AppBar` dan body aplikasi. Pada bagian body digunakan `SingleChildScrollView` agar seluruh isi halaman dapat digulir ke bawah karena terdapat banyak widget di dalam aplikasi.

Contoh code:

```dart id="4hhz2m"
return Scaffold(
  appBar: AppBar(
    title: const Text('MODUL 4-5'),
    centerTitle: true,
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        sectionTitle('1. Container'),
      ],
    ),
  ),
);
```

Penjelasan code:

* `Scaffold` digunakan sebagai struktur utama halaman.
* `AppBar` digunakan untuk membuat baris judul di bagian atas.
* `SingleChildScrollView` membuat halaman dapat di-scroll.
* `Column` digunakan untuk menyusun widget secara vertikal.

---

#### 4. Widget `Container`

Widget `Container` digunakan untuk membuat kotak tampilan yang dapat diberi warna, ukuran, dan dekorasi. Pada aplikasi ini, Container digunakan sebagai kartu identitas mahasiswa dengan warna gradasi biru.

Contoh code:

```dart id="8zzl42"
Container(
  height: 130,
  width: double.infinity,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.blue, Colors.lightBlueAccent],
    ),
    borderRadius: BorderRadius.circular(24),
  ),
)
```

Penjelasan code:

* `height` digunakan untuk menentukan tinggi Container.
* `width: double.infinity` membuat lebar memenuhi layar.
* `LinearGradient` memberikan efek warna gradasi.
* `borderRadius` membuat sudut Container melengkung.

---

#### 5. Widget `GridView.builder`

Widget `GridView.builder` digunakan untuk menampilkan data dalam bentuk grid atau kotak-kotak. Pada aplikasi ini digunakan untuk menampilkan menu layanan laundry.

Contoh code:

```dart id="z3n8e2"
GridView.builder(
  itemCount: gridItems.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemBuilder: (context, index) {
    return Text(gridItems[index]['title']);
  },
)
```

Penjelasan code:

* `itemCount` menentukan jumlah item yang ditampilkan.
* `crossAxisCount: 2` berarti grid memiliki 2 kolom.
* `itemBuilder` digunakan untuk membuat item secara otomatis.

---

#### 6. Widget `ListView`

Widget `ListView` digunakan untuk membuat daftar item secara vertikal. Pada aplikasi ini digunakan untuk menampilkan proses laundry.

Contoh code:

```dart id="c1s7lj"
ListView(
  children: const [
    CustomTile('Pakaian Masuk', Icons.inventory_2),
    CustomTile('Sedang Dicuci', Icons.local_laundry_service),
    CustomTile('Siap Diambil', Icons.check_circle),
  ],
)
```

Penjelasan code:

* `children` berisi daftar widget yang akan ditampilkan.
* `CustomTile` digunakan untuk membuat tampilan list lebih rapi.
* `Icons` digunakan untuk menampilkan ikon pada item list.

---

#### 7. Widget `ListView.builder`

Widget `ListView.builder` digunakan untuk membuat daftar otomatis berdasarkan jumlah data pada list.

Contoh code:

```dart id="63dk40"
ListView.builder(
  itemCount: layananLaundry.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(layananLaundry[index]),
    );
  },
)
```

Penjelasan code:

* `itemCount` mengambil jumlah data dari list.
* `index` digunakan untuk mengambil data sesuai urutan.
* `ListTile` digunakan untuk membuat tampilan item list.

---

#### 8. Widget `ListView.separated`

Widget `ListView.separated` digunakan untuk membuat daftar dengan garis pemisah antar item.

Contoh code:

```dart id="4fbl5h"
ListView.separated(
  itemCount: layananLaundry.length,
  separatorBuilder: (context, index) =>
      const Divider(color: Colors.blue),
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(layananLaundry[index]),
    );
  },
)
```

Penjelasan code:

* `separatorBuilder` digunakan untuk membuat pembatas antar item.
* `Divider` digunakan sebagai garis pemisah.
* `itemBuilder` digunakan untuk membuat item list.

---

#### 9. Widget `Stack`

Widget `Stack` digunakan untuk menumpuk beberapa widget dalam satu area. Pada aplikasi ini digunakan untuk membuat tampilan promo laundry.

Contoh code:

```dart id="gmbh4m"
Stack(
  children: [
    Positioned(
      top: 25,
      left: 25,
      child: Container(
        width: 110,
        height: 110,
        color: Colors.blue,
      ),
    ),
    const Positioned(
      bottom: 20,
      right: 20,
      child: Text('Clean & Fresh'),
    ),
  ],
)
```

Penjelasan code:

* `Stack` digunakan untuk menumpuk widget.
* `Positioned` digunakan untuk mengatur posisi widget.
* `top`, `left`, `bottom`, dan `right` digunakan untuk menentukan letak widget.
* `Text('Clean & Fresh')` digunakan untuk menampilkan tulisan promo laundry.

---

## OUTPUT



