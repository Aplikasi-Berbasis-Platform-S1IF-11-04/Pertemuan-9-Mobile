# Praktikum Modul 4-5 Flutter

Proyek ini merupakan implementasi beberapa widget dasar Flutter yang sering digunakan dalam pembuatan antarmuka pengguna (UI). Aplikasi menampilkan contoh penggunaan Container, GridView, ListView, ListView.builder, ListView.separated, dan Stack dalam satu halaman.

## Fitur yang Diimplementasikan

* Container
* GridView
* ListView
* ListView.builder
* ListView.separated
* Stack

---

## 1. Container

Widget **Container** digunakan untuk membuat area atau kotak yang dapat diberi warna, ukuran, margin, padding, serta dekorasi lainnya.

### Implementasi

Menampilkan sebuah kotak berwarna dengan teks di bagian tengah.

---

## 2. GridView

Widget **GridView** digunakan untuk menampilkan data dalam bentuk grid atau kisi-kisi.

### Implementasi

Menampilkan 6 item yang tersusun dalam 3 kolom.

---

## 3. ListView

Widget **ListView** digunakan untuk menampilkan daftar item secara vertikal.

### Implementasi

Menampilkan 3 item statis:

* Pilihan A
* Pilihan B
* Pilihan C

---

## 4. ListView.builder

Widget **ListView.builder** digunakan untuk membuat daftar secara dinamis berdasarkan jumlah data yang tersedia.

### Implementasi

Menampilkan daftar minuman yang berasal dari sebuah array.

Contoh data:

* Kopi
* Teh
* Jus Jeruk
* Susu
* Cokelat

---

## 5. ListView.separated

Widget **ListView.separated** digunakan untuk menampilkan daftar yang memiliki pemisah antar item.

### Implementasi

Menampilkan daftar kendaraan dengan garis pembatas (Divider) di antara setiap item.

Contoh data:

* Mobil
* Motor
* Sepeda
* Bus
* Kereta

---

## 6. Stack

Widget **Stack** digunakan untuk menumpuk beberapa widget dalam satu area.

### Implementasi

Menampilkan dua buah Container yang saling bertumpuk dengan teks di bagian tengah.

---

## Struktur Widget

```text
HomePage
│
├── Container
├── GridView
├── ListView
├── ListView.builder
├── ListView.separated
└── Stack
```

## Cara Menjalankan

1. Clone repository:

```bash
git clone https://github.com/jianst-21/Aplikasi-Berbasis-Platform-S1IF-11-04/Pertemuan-9-Mobile.git
```

2. Masuk ke folder project:

```bash
cd 2311102262_Aji Noto Sutrisno
cd SourceCode
```

3. Install dependency:

```bash
flutter pub get
```

4. Jalankan aplikasi:

```bash
flutter run
```

## Hasil

Aplikasi menampilkan contoh penggunaan berbagai widget dasar Flutter dalam satu halaman sehingga dapat digunakan sebagai media pembelajaran mengenai komponen UI Flutter.

## Author

Aji Noto Sutrisno
