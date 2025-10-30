# Tasaki Shop
# Misaka City's Best Football Merchandise

# Tugas 7: Elemen Dasar Flutter

## 1. Apa itu *widget tree*?
Widget tree merupakan representasi hierarkis dari semua widget yang kita gunakan dalam suatu aplikasi Flutter. Struktur widget tree tak jauh berbeda dengan HTML DOM tree yang digunakan dalam pengembangan web, yaitu dimulai dari suatu elemen root (root widget pada Flutter dan `<html>` pada web) yang memiliki elemen anak; elemen anak itu pun sendirinya dapat memiliki anak. Perbedaannya, pada HTML DOM, elemen anak berupa elemen HTML seperti `<p>`, `<img>`, `<span>`, dan `<section>`, sedangkan pada widget tree Flutter, elemen anaknya juga akan berupa Widget. 

Widget tree digunakan untuk *inheritance* deskripsi (sifat-sifat) widget dari elemen orangtua atau *parent*-nya. Sebagai contoh, jika di suatu widget didefinisikan warna *background* merah, maka semua widget anaknya juga akan berwarna merah kecuali mereka sendiri mengaturnya. Oleh sebab itu, jika kita mengubah sifat suatu widget, maka Flutter tidak hanya harus me-*reload* widget tersebut, tetapi juga semua widget penerusnya (anak, cucu, dst.) untuk menerapkan perubahan tersebut.

## 2. Apa saja widget yang anda gunakan?
- MyApp, sebagai root dari aplikasi.
    - Kelas ini juga menerapkan MaterialApp.
- Scaffold, untuk membuat *layout* dasar aplikasi.
- AppBar, untuk menampilkan judul dan menu aplikasi.
- Text, untuk mencetak konten berupa teks.
- Theme, untuk menerapkan tema (pilihan tampilan, seperti warna dan font).
- Padding, untuk menerapkan ruang pembatas (*padding*) pada elemen anaknya.
- Column, untuk menampilkan elemen-elemen anaknya dalam urutan vertikal.
- ItemHomepage, untuk menyimpan data untuk menu yang akan ditampilkan di homepage.
- ItemCard, untuk menampilkan/merender data pada ItemHomepage.
    - InkWell, untuk menerima/membaca sentuhan user.
- Container, untuk membantu posisi dan ukuran elemen.
    - Center, untuk memusatkan elemen di layar.
    - Icon, untuk menampilkan gambar kecil (ikon).

## 3. Apa fungsi MaterialApp?
Mengutip dari dokumentasi API Flutter, MaterialApp merupakan widget yang menandai aplikasi kita menggunakan Material Design, yaitu *framework* desain antarmuka rancangan Google yang sering digunakan di aplikasi Flutter (termasuk iOS, Android, dan web). MaterialApp menggabungkan sejumlah widget yang diperlukan developer untuk sepenuhnya menerapkan prinsip dan spesifikasi Material Design. Salah satu alternatif MaterialApp adalah CupertinoApp, yang memiliki fungsi yang sama tetapi menyasar Cupertino Design yang utamanya digunakan di iOS.

MaterialApp sering digunakan sebagai widget root pada suatu aplikasi karena menyediakan fitur-fitur dasar untuk fungsionalitas aplikasi serta mendasari bahasa desain yang digunakan aplikasi. Misalnya, WidgetsApp (kelas parent dari MaterialApp) menghubungkan aplikasi kita dengan hardware sistem, yaitu memetakan tombol *back* pada ponsel kita ke perintah "kembali ke halaman sebelumnya" di aplikasi.

## 4. Apa yang membedakan StatelessWidget dan StatefulWidget?
Dalam Flutter, **State** merupakan informasi yang disimpan suatu app atau widget untuk memengaruhi kondisinya. Sesuai dengan namanya, StatelessWidget dan StatefulWidget dibedakan dari ada tidaknya state yang mereka simpan.

**StatelessWidget** tidak perlu menyimpan informasi state; semua informasi yang diperlukannya ia peroleh dari parent atau dari `BuildContext` yang digunakan. Hal ini menyebabkan StatelessWidget tidak dapat berubah dengan sendirinya. Namun, widget ini tetap dapat diubah tampilan dan isinya oleh parent. Karena sifatnya yang tidak mengubah informasi, semua variabel pada StatelessWidget pasti bersifat `final`, yang artinya variabel itu tidak dapat diubah. Variabel inilah yang menjadi dasar penggambaran widget tersebut di layar. 

Sebaliknya, **StatefulWidget** menyimpan informasi state yang dibutuhkannya dan dapat mengubah diri berdasarkan state tersebut. Informasi ini akan dibaca secara *synchronous* ketika objek widget diciptakan dan dapat diupdate seiring waktu. Perubahan state ini dapat menyebabkan isi ataupun tampilan widget berubah. State ini disimpan tidak di dalam objek widget itu sendiri, tetapi di dalam sebuah objek pendamping (objek State), yang akan diacu oleh widget-widget lain atau fungsi pada aplikasi untuk memanipulasi widget ini.

Kita dapat menggunakan StatelessWidget jika bagian UI kita yang diwakili widget tersebut tidak atau jarang berubah, misalnya judul aplikasi atau teks berbentuk paragraf. Sebaliknya, kita dapat menggunakan StatefulWidget jika widget tersebut mewakili tampilan yang ingin kita ganti berdasarkan konteks, misalnya objek yang berubah warna setelah disentuh oleh user.

## 5. Apa itu BuildContext?
Mengutip dokumentasi Flutter, **BuildContext** merupakan informasi mengenai posisi widget tertentu di dalam widget tree. Setiap widget diciptakan dengan suatu BuildContext, dan ketika widget tersebut memiliki anak, BuildContext tersebut akan di-*passing* untuk menciptakan widget anak. Hasilnya, setiap widget anak akan mengetahui widget mana yang menjadi orangtuanya.

Fungsi `build()` merupakan fungsi yang perlu diimplementasikan pada semua widget, baik itu stateless maupun stateful. Build berfungsi seperti *constructor* pada bahasa seperti Java atau Python, yaitu menciptakan widget dengan sifat-sifat tertentu. Selain sifat atau konten yang perlu ditampilkan oleh widget, build juga memerlukan parameter BuildContext yang menandai posisi yang akan ditempati oleh widget anak tersebut di dalam widget tree. Dengan dilewatkannya BuildContext ke setiap build, terciptalah jaringan widget yang kohesif, di mana setiap widget dapat mengetahui widget mana yang ada di atas dan bawahnya.

## 6. Apa itu hot reload? Apa bedanya dengan hot restart?
Hot reload merupakan salah satu fitur debugging dalam bahasa Dart. Mengutip dari dokumentasi Flutter, hot reload melewatkan kode Dart terbaru dari IDE ke sistem *runtime* VM Dart yang tengah dijalankan. Pembaruan kode ini menyebabkan semua widget dalam widget tree direka ulang (rebuild), sehingga tampilan dan fungsi widget berubah sesuai dengan kode yang baru. Akan tetapi, hot reload tidak menjalankan kembali fungsi `main()` atau `initState()` di masing-masing widget, sehingga state widget tidak hilang. Hasilnya, kita dapat melihat hasil perubahan kode kita dengan cepat tanpa kehilangan informasi yang sudah ada di dalam app.

Hot restart juga memberikan kode terbaru kepada VM Dart, tetapi ikut me-*restart* aplikasi Flutter itu sendiri. Hal ini akan menyebabkan state widget hilang dan kembali ke state awal. Hot restart tidak secepat hot reload, tetapi bermanfaat jika kita ingin melakukan uji aplikasi dengan state yang berbeda, misalnya informasi atau user lainnya.

## Referensi Tugas 7
Tim Dosen PBP. (2025). *Intro to Dart Programming and Flutter Framework*. Fakultas Ilmu Komputer Universitas Indonesia.

Dokumentasi API Flutter. Google. Diakses dari https://api.flutter.dev

Dokumentasi Flutter. Google. Diakses dari https://docs.flutter.dev