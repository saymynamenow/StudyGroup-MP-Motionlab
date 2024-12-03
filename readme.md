# Slicing UI Motion Lab #2

## Definisi

Widget adalah komponen yang saling terhubung untuk membentuk UI di Flutter, setiap elemen visual di flutter adalah widget mulai dari tombol teks layout hingga animasi Flutter menggunkaan konsep widget tree.

## Pohon widget

Itu seperti pohon dan akar, like decission tree in ML.
Ex : MyApp > MaterialApp > Scaffold > Container

### MaterialApp

Adalah widget root dalam aplikasi flutter yang meingimplementasikan desain material design menyediakan konfigurasi dasar dari project tersebut

### Scaffold

Setiap halaman dalam Flutter biasanya memiliki Scaffold sebagai widget utama

## Widget Essential

    1. SafeArea
       Agar tidak bertabrakan dengan UI component di Handphone nya
    2. Text
       Untuk menampilkan Text
    3. Container
       Untuk membuat section tertentu seperti kotak atau sebagainya
    4. Icon
       Untuk menampilkan Icon
    5. Image
       Menampilkan Image
    6. Button
       Membuat button

## Widget Layoting

    1. Column
       Widget yang bisa menyimpan satu/lebih widget secara vertical
       MainAxis - Secara vertikal
    2. Row
       Widget yang bisa menyimpan satu/lebih widget secara horizontal
       MainAxis - Secara Horizontal

### NB : Kalau mau import image secara local harus config di pubspec.yaml
