# Tasaki Shop: Misaka City's Best Football Merchandise

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


# Tugas 8: Flutter Navigation & Forms

## 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`
`push()` dan `pushReplacement()` merupakan dua cara untuk menambahkan halaman (*route*) baru ke *stack* navigasi Flutter. Navigasi antarhalaman dalam aplikasi Flutter dilakukan lewat stack, dengan mengklik tautan akan mem-*push* halaman baru, dan kembali akan mem-*pop* stack. Aplikasi akan menampilkan halaman yang paling atas dalam stack (*peek*).

**`push()`** merupakan cara navigasi yang paling sederhana, yaitu sekedar menambahkan halaman baru ke paling atas stack sehingga ditampilkan oleh aplikasi. Di sisi lain, **`pushReplacement()`** agak lebih rumit, yaitu *mengganti* halaman yang sedang ditampilkan ke user. Secara sekilas, hasil dari kedua operasi ini sama, tetapi *use case*-nya berbeda terutama ketika kita sudah memiliki aplikasi yang matang dan banyak fiturnya.

Perbedaan pemanfaatan ini dapat kita pahami dengan mengamati penamaan yang digunakan pada Flutter untuk perubahan halaman, yaitu *route*. Kita dapat menggambarkan suatu aplikasi sebagai peta yang berpusat dari *homepage* dan memiliki beberapa jalan yang mengarah kepada fungsi yang berbeda, seperti berikut:

```
                    Profiles
                       |
                       |
                       |
                       |
News ============ [Home Page] ============ Forums
                       |
                       |
                       |
                       |
                      Shop
```

**Kita menggunakan `pushReplacement()` untuk berpindah jalan, dan kita menggunakan `push()` untuk melanjutkan perjalanan di satu rute.** Logikanya, ketika kita menelusuri rute News, kita harus bergerak secara berurutan dan sistematis di rute tersebut sehingga kita dapat mengetahui jalan pulang (ini diwujudkan dengan mendorong halaman baru ke route yang sudah ada, sehingga riwayat halaman yang dikunjungi dapat ditelusuri kembali jika kita menekan *back*). 

Jika kita ingin berpindah rute dari News ke Forums, maka kita harus kembali ke homepage (titik pusat) dan memulai rute baru tersebut dari awal. Ini diwujudkan dengan `pushReplacement()` yang menghapus rute yang sedang ditampilkan dan menggantinya dengan rute baru. Misalnya, jika kita sudah membaca beberapa artikel di News, kemudian kita pergi ke Forums dan menekan *back*, maka kita bukan akan menelusuri kembali histori membaca News kita, melainkan kembali ke homepage.

## 2. Bagaimana anda memanfaatkan *hierarchy widget*?
Widget seperti **`Scaffold`, `AppBar`, dan `Drawer`** membantu kita untuk merancang aplikasi dengan menyediakan *framework* di mana kita dapat menempatkan elemen dengan posisi dan fungsionalitas tertentu. Sebagai contoh, saat memanfaatkan AppBar, kita tidak perlu repot-repot membuat suatu widget yang menempel ke atas layar, menempatkan teks dan elemen lainnya di dalam widget tersebut, dan lain-lain; kita cukup memberikan teks atau elemen yang kita inginkan dalam bentuk argumen ke AppBar, dan jadilah fitur tersebut.

Adanya widget-widget ini juga ikut membantu konsistensi aplikasi karena dapat digunakan kembali di beberapa halaman. Kita dapat membuat suatu *custom widget* (inherit StatelessWidget atau StatefulWidget) dan membuat fitur yang kita inginkan di dalam method `build()`. Artinya, setiap kali kita menciptakan *instance* dari widget tersebut, kita akan memperoleh struktur dan isi yang sama. Menggunakan widget seperti ini akan membantu bahasa desain aplikasi yang kohesif serta menonjolkan filosofi DRY (*Don't Repeat Yourself*) dalam pemrograman.

## 3. Apa kelebihan menggunakan *layout widget* seperti `Padding` dan `ListView`?
Widget-widget ini dimanfaatkan seperti CSS pada aplikasi web, yaitu untuk menentukan penempatan dan ukuran masing-masing widget pada aplikasi kita. Misalnya, Padding digunakan untuk membuat ruang tambahan di sekitar suatu widget agar widget tersebut terlihat lebih besar dan jelas. Membungkus elemen-elemen formulir kita dengan *layout widget* akan mempermudah kita dalam menyusun tampilan yang kita inginkan, alih-alih sekedar meletakkan aplikasi tersebut di dalam *body* halaman (Scaffold) kita.

Sebagai contoh, dalam *form* yang kita buat, kita memanfaatkan `SingleChildScrollView()`. Dari dokumentasi Flutter, widget ini menerima satu elemen anak serta mengatur supaya anak tersebut dapat digulir (di-*scroll*) apabila terjadi *overflow*. Widget ini sangat bermanfaat untuk menampilkan elemen yang mungkin terlalu panjang atau tinggi untuk ditampilkan di beberapa perangkat (misalnya ponsel dalam mode landscape). Untuk anak dari widget tersebut, kita menggunakan `Column()`, salah satu widget layout paling sederhana yang menampilkan widget-widget anaknya secara vertikal.

## 4. Bagaimana anda menyesuaikan warna tema?
Konsistensi warna dan desain aplikasi dapat diwujudkan dengan beberapa cara:
- Menggunakan *widget* yang sama di setiap halaman, misalnya AppBar, Drawer, dan header/footer jika ada.
- Menggunakan tema. Kita mendefinisikan tema di `main.dart` sebelum aplikasi dimulai. Tema ini mengelola tampilan *default* untuk semua widget di aplikasi, seperti warna (color scheme), tampilan teks (font), dan *styling* untuk berbagai widget seperti tombol dan field input. Widget tema akan "membersamai" root dan menurun ke semua widget di bawahnya, sehingga dapat dipanggil dari mengatur semua widget.

  Untuk memanfaatkan tema, kita dapat memanggil atribut di tema tersebut untuk digunakan di atribut widget yang sesuai. Sebagai contoh, untuk mengatur warna AppBar di tutorial, kita menggunakan `Theme.of(context).colorScheme.primary`, yaitu warna utama dari color scheme pada tema. Kita dapat menyamakan tampilan warna seluruh aplikasi dengan menggunakan warna yang cocok dari color scheme tersebut di widget-widget kita.

## Referensi Tugas 8
Dokumentasi API Flutter. Google. Diakses dari https://api.flutter.dev

Dokumentasi Flutter. Google. Diakses dari https://docs.flutter.dev

# Tugas 9
## 1. Jelaskan bagaimana anda mengimplementasikan checklist di atas
- **Implementasi fitur registrasi, login, dan logout** dilakukan dengan menciptakan *app* baru di aplikasi Django untuk menerima input autentikasi, menciptakan formulir login dan registrasi di aplikasi Flutter (dengan field input dan TextInputController untuk membaca input tersebut), lalu mengirimkan informasi dari formulir tersebut ke *view* Django melalui HTTP *request* POST. Dengan adanya fungsi ini, Django mampu meloginkan pengguna dari isi request POST, bukan dari AuthenticationForm. Spesifik pada fungsi registrasi, kita memuat informasi form ke bentuk JSON kemudian mengolahnya di dalam *view*.
- **Membuat model** dilakukan dengan memasukkan bentuk JSON model Django untuk produk ke dalam app.quicktype.io, lalu menyalin kode Dart yang dihasilkan oleh *code generator*. Kode ini memiliki method untuk mengolah model menjadi JSON dan sebaliknya.
- **Membuat halaman list produk** dilakukan dengan terlebih dahulu membuat sebuah *card* produk yang menampilkan nama, stok, harga, penjual, deskripsi, gambar *thumbnail*, kategori, dan status *featured* masing-masing produk. Kemudian, di halaman list produk, kita menggunakan widget FutureBuilder yang berfungsi membuat widget-widget pada halaman berdasarkan hasil Future yang diperoleh. Di sini, kita menggunakan FutureBuilder untuk membuat ListView, dan ListView itu sendiri memiliki builder yang melakukan iterasi terhadap list produk yang didapatkan oleh Future. Untuk menyiapkan data ini, kita membuat sebuah fungsi asinkronus yang menarik informasi JSON dari app Django kita.
- **Filtering pada halaman list produk** dilakukan dengan mengambil data user dari request, kemudian memodifikasi fungsi async di atas agar hanya meng-output produk yang dijual oleh user tersebut. Kemudian, kita menghubungkannya ke tombol "My Products" yang ada di homepage. 
- **Membuat halaamn detail produk** dilakukan dengan menambahkan fungsi onTap pada product card yang sudah kita buat di list produk, dengan fungsi ini membuka detail produk yang bersangkutan (menggunakan snapshot karena diambil dari future). Kemudian, kita cukup mendesain halaman detail produk agar menampilkan informasi yang kita butuhkan (sama dengan product card, kecuali deskripsi produk yang ditampilkan sepenuhnya).

## 2. Mengapa membuat model Dart untuk memproses data JSON?
Model, berupa objek/kelas dalam struktur Dart, memiliki sekumpulan atribut dengan type tertentu (misalnya, objek Person dapat memiliki String name, int age, dan bool isStudent). Dengan melewatkan semua pengolahan JSON ke model, kita dapat **memvalidasi isi dari JSON tersebut terhadap field yang kita perlukan**. Hal ini berbeda dengan loading JSON tanpa model, yang menggunakan `Map<String, Dynamic>`. Dynamic pada Dart artinya tidak memiliki type yang pasti, sehingga jika kita memerlukan fungsi-fungsi khusus type tertentu (misalnya length untuk string, penjumlahan/pengurangan untuk angka), kita tidak akan tahu apakah fungsi-fungsi tersebut bisa digunakan sampai runtime. Dengan pengukuhan type dalam model, kita dapat mengetahuinya sebagai compile error, sehingga debugging menjadi lebih mudah.

Terkait dengan typing, model juga membantu kita **memastikan null safety yang baik**, karena dengan type yang pasti datang juga keharusan mengelola null. Kita dapat memastikan terlebih dahulu apakah suatu atribut pada model dapat bernilai null atau tidak, kemudain membuat kode lainnya dengan mempertimbangkan hal itu. Type Dynamic tidak mengikuti aturan null safety dari type Dart lain karena tidak memiliki type yang pasti. Hal ini artinya kalaupun kita tidak ingin suatu field bernilai null, kita dapat memberikan nilai null tanpa peringatan atau compile error. Akhirnya hal ini dapat mengakibatkan runtime error ke depannya.

Menggunakan model juga menerapkan praktik OOP yang baik, yaitu menulis kode yang dapat digunakan kembali dalam berbagai konteks. Seandainya kita tidak menggunakan model, kita haus menulis kode read dan write JSON di setiap halaman yang membutuhkannya. Ini artinya model membuat **maintainability lebih mudah**, karena ketika terjadi masalah pada kode atau perubahan pada backend, kita hanya harus memperhatikan satu titik, yaitu kode model itu saja.

## 3. Apa perbedaan API `http` dan `CookieRequest`?
API `http` dan `CookieRequest` keduanya berperan dalam mengakses data dari web app Django kita, tetapi memiliki fungsi yang berbeda. 

`http` digunakan untuk memproses HTTP request dan response. Kedua hal ini dibutuhkan agar app Flutter dapat berkomunikasi dengan app Django karena "bahasa" utama yang digunakan dalam transfer data di web adalah HTTP. `http` digunakan secara *behind-the-scenes* di fungsi asinkronus untuk menerima response HTTP dan menerjemahkannya menjadi bentuk yang dapat dimengerti oleh kode Dart, seperti JSON.

`CookieRequest` berfungsi untuk menyimpan dan mengolah data *cookie* yang ada pada app Django kita. API ini penting karena tanpa HTTP *cookie*, informasi state seperti login user tidak akan dapat berpindah bersama page. Oleh karena itu, kita menggunakan Provider untuk "membersamai" semua halaman pada app Flutter dengan CookieRequest.

## 4. Mengapa CookieRequest perlu dibagikan ke semua elemen di Flutter?
Seperti yang sudah dijelaskan pada bagian sebelumnya `CookieRequest` berfungsi untuk menyimpan data HTTP *cookie* dari aplikasi Django. Cookie diperlukan pada sistem HTTP untuk menyimpan state atau session yang berlaku dan perlu dilewatkan ke setiap webpage.

Menggunakan Provider untuk membagikan CookieRequest ke semua widget Flutter meniru sifat cookie ini. Dengan adanya Provider, semua widget dapat membaca data cookie yang mungkin diperlukannya, seperti informasi login user. Jika tidak, mungkin saja proses autentikasi harus diulang di setiap halaman. Hal ini serupa dengan penggunaan widget Theme yang sudah kita buat di `main.dart`; widget ini dilewatkan melalui widget tree ke semua widget lainnya, sehingga semua widget dapat menggunakan informasi tema untuk mengatur warna, tampilan teks, dan tampilan lainnya.

## 5. Mengapa kita perlu melakukan banyak konfigurasi konektivitas?
Semua konfigurasi jaringan yang perlu kita lakukan untuk interfacing Django-Flutter, seperti mengatur `ALLOWED_HOSTS` di app Django, mengaktifkan CORS, menggunakan `@csrf_exempt`, dan mengatur Android Manifest untuk mengizinkan internet, terkait dengan satu masalah, yaitu *security*. Secara default, banyak framework termasuk Django dan Flutter mengimplementasikan beragam jenis proteksi terhadap serangan siber, seperti CORS (cross-origin resource sharing), XSS (cross-site scripting), CSRF (cross-site request forgery), dan sebagainya. Pengaturan yang kita lakukan berfungsi untuk memastikan bahwa aplikasi kita lulus pengecekan security (mengatur `ALLOWED_HOSTS` dan Android Manifest) atau mem-*whitelist* aplikasi kita agar dapat menghindari pengecekan tersebut (`@csrf_exempt`).

## 6. Seperti apa mekanisme pengiriman data, mulai dari input hingga ditampilkan pada Flutter?
Kita akan menggunakan data produk untuk menjelaskan prosedur ini:
- Pengguna mendaftarkan data produk ke dalam formulir produk baru, di `productform_screen.dart`. Kode pada formulir juga bertugas untuk memvalidasi input yang diberikan.
- Isi formulir diubah menjadi JSON, lalu dikirim ke *view* Django melalui POST.
- Django menarik data dari JSON yang dikirim, lalu mendaftarkan model produk ke dalam *database* di *backend*.
- Pengguna membuka list produk.
- Flutter melakukan request GET melalui fungsi asinkronus ke app Django untuk mendapatkan daftar produk yang ada di *database*.
- Dengan FutureBuilder, Flutter menampilkan masing-masing produk pada halaman list.

## 7. Seperti apa mekanisme autentikasi?
- Pengguna membuka aplikasi, halaman pertama yang muncul adalah halaman login.
- Pengguna memasukkan informasi login ke dalam formulir.
- Flutter menggunakan fungsi asinkronus untuk mengirim POST ke *view* Django yang menangani login. Isi request tersebut adalah username dan password yang diinput oleh pengguna.
- Django mengecek informasi user dan mencocokannya dengan *database*. Hasil pengecekan dikembalikan ke Flutter, apakah identitas user valid atau tidak.
- Apabila login berhasil, Flutter akan mem-push halaman utama ke Navigator dan menampilkannya ke user, beserta dengan mengaitkan cookie dari app Django ke request.
- Apabila gagal, Flutter akan menampilkan pesan error pada halaman login.
- Jika pengguna ingin mendaftar (register), akan ditampilkan halaman registrasi yang memiliki field username, password, dan konfirmasi password.
- Kali ini, ketika view Django menerima POST berisi identitas registrasi, yang akan diperiksa adalah apakah kedua password sama dan apakah ada user dengan username yang sama di *database*. Hasil pengecekan ini akan dikembalikan ke Flutter.
- Jika registrasi berhasil, user akan dibawa ke halaman login; jika gagal, pesan error akan ditampilkan.
- Apabila user ingin logout, Flutter menjalankan fungsi asinkronus untuk memanggil logout dari Django. Jika logout berhasil, user akan dikembalikan ke halaman login.
