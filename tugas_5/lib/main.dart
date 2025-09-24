import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(const BelajarImage());

class News {
  final String imageUrl;
  final String title;
  final String subtitle;

  const News({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

const List<News> newsList = [
  News(
    imageUrl: 'https://asset.kompas.com/crops/SEObmopwziS9eBl9L7EyKWDvf3I=/0x0:0x0/1200x800/data/photo/2025/09/22/68d119632b464.jpeg',
    title: 'Cak Imin Pastikan MBG Tak Disetop meski Banyak Kasus Keracunan',
    subtitle: 'Menteri Koordinator Bidang Pemberdayaan Masyarakat Muhaimin Iskandar ...',
  ),
  News(
    imageUrl: 'https://akcdn.detik.net.id/community/media/visual/2025/09/24/massa-hari-tani-di-depan-dpr-bubar-1758712280021_169.jpeg?w=700&q=90',
    title: 'Massa Demo Hari Tani di DPR Bubar, Lalin Kembali Dibuka',
    subtitle: 'Masa aksi demonstrasi Hari Tani Nasional di depan gedung MPR/DPR RI ...',
  ),
  News(
    imageUrl: 'https://asset.kompas.com/crops/M_Mmgo3Gu7O99bP_4fiE310GYP8=/0x0:0x0/1200x800/data/photo/2025/09/23/68d26117c93b5.jpg',
    title: 'Pemkot Tangsel Klarifikasi Anggaran ATK Rp 38 Miliar, Bukan Hanya untuk Kertas dan Pena',
    subtitle: 'Pemerintah Kota Tangerang Selatan (Pemkot Tangsel) memberikan penjelasan ...',
  ),
  News(
    imageUrl: 'https://akcdn.detik.net.id/community/media/visual/2025/09/24/jalanan-area-hualien-taiwan-dipenuhi-lumpur-usai-topan-super-ragasa-menerjang-1758687517223_169.jpeg?w=700&q=90',
    title: 'Topan Ragasa Tewaskan 14 Orang di Taiwan, 124 Hilang',
    subtitle: 'Topan super Ragasa menerjang pusat wisata populer Hualien di wilayah ...',
  ),
  News(
    imageUrl: 'https://awsimages.detik.net.id/visual/2025/09/19/ilustrasi-kementerian-badan-usaha-milik-negara-bumn-1758285683584_169.jpeg?w=900&q=80',
    title: 'Pemerintah Kasih Sinyal Mau Hapus Kementerian BUMN',
    subtitle: 'Presiden Prabowo Subianto telah menyampaikan revisi Undang-Undang BUMN ...',
  ),
];

class BelajarImage extends StatelessWidget {
  const BelajarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Daftar Berita')),
        body: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final news = newsList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage( 
                      imageUrl: news.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()), 
                      errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 40), 
                    ),
                  ),
                ),
                title: Text(news.title),
                subtitle: Text(news.subtitle),
                trailing: const Icon(Icons.bookmark_border),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Mengalihkan ke halaman berita'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}