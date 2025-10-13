import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final String nama;
  final String npm;
  final String email;
  final String alamat;
  final String nomorHp;
  final String jenisKelamin;
  final String tanggalLahir;
  final String jamBimbingan;

  const HasilPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.email,
    required this.alamat,
    required this.nomorHp,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.jamBimbingan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Formulir')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Nama'),
                  subtitle: Text(nama),
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: Text('NPM'),
                  subtitle: Text(npm),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text(email),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text('Alamat'),
                  subtitle: Text(alamat),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text('Nomor HP'),
                  subtitle: Text(nomorHp),
                ),
                ListTile(
                  leading: const Icon(Icons.transgender),
                  title: Text('Jenis Kelamin'),
                  subtitle: Text(jenisKelamin),
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text('Tanggal Lahir'),
                  subtitle: Text(tanggalLahir),
                ),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text('Jam Bimbingan'),
                  subtitle: Text(jamBimbingan),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
