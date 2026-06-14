Flutter UI Components Demo
Aplikasi ini mendemonstrasikan implementasi dasar dari berbagai widget tata letak dan daftar yang sering digunakan dalam pengembangan Flutter.

Komponen Utama
Container: Digunakan untuk membuat kotak dengan dekorasi (warna, border-radius, dan bayangan).

Stack: Memungkinkan penumpukan widget di atas satu sama lain (seperti lapisan).

GridView: Menampilkan item dalam format grid (kisi) yang rapi.

ListView:

Statik: Daftar item yang didefinisikan secara manual.

Builder: Efisien untuk menampilkan daftar data dinamis dari sebuah array.

Separated: Daftar yang dilengkapi dengan pembatas (divider) di setiap itemnya.

Catatan Teknis
Layout: Menggunakan SingleChildScrollView sebagai pembungkus utama agar konten dapat di-scroll jika melebihi ukuran layar.

Performa: Pada GridView dan ListView yang berada di dalam Column, digunakan shrinkWrap: true dan physics: NeverScrollableScrollPhysics() agar scrolling tetap dikendalikan oleh induk utamanya (SingleChildScrollView).

Modularitas: Terdapat widget SectionTitle untuk menjaga konsistensi tampilan judul setiap bagian aplikasi.
