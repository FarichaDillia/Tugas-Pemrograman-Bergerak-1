import 'package:flutter/material.dart';
import 'profile_page.dart';

import 'package:tugas_2/input_mahasiswa_page.dart';
import 'package:tugas_2/models/mahasiswa.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Mahasiswa? mahasiswa; // simpan data mahasiswa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Latihan 1: Profile Page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      namaaplikasi: "My Flutter App",
                      versiaplikasi: "1.0.0",
                      namadeveloper: "Faricha Dillia Dinda Thomas",
                    ),
                  ),
                );
              },
              child: const Text("Go to Profile Page"),
            ),

            //Latihan 2: Input Mahasiswa
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<Mahasiswa>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputMahasiswaPage(),
                  ),
                );

                if (!mounted) return; // cegah warning

                if (result != null) {
                  setState(() {
                    mahasiswa = result;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Data ${result.nama} berhasil disimpan"),
                    ),
                  );
                }
              },
              child: const Text("Input Mahasiswa"),
            ),

            if (mahasiswa != null) ...[
              const SizedBox(height: 20),
              Text("Nama: ${mahasiswa!.nama}"),
              Text("Umur: ${mahasiswa!.umur}"),
              Text("Alamat: ${mahasiswa!.alamat}"),
              Text("Kontak: ${mahasiswa!.kontak}"),
              const SizedBox(height: 10),

              //Latihan 3: Call Kontak
              ElevatedButton(
                onPressed: () async {
                  final Uri telUri = Uri(
                    scheme: 'tel',
                    path: mahasiswa!.kontak,
                  );
                  if (await canLaunchUrl(telUri)) {
                    await launchUrl(
                      telUri,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Tidak ada aplikasi Telepon di perangkat ini"),
                      ),
                    );
                  }
                },
                child: const Text("Panggil Mahasiswa"),
              ),
            ],

            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
