import 'screens/detail_screen.dart';

import 'package:flutter/material.dart';

import 'widgets/custom_card.dart';
import 'widgets/custom_button.dart';

void main() {
  runApp(const  TechEventApp());
}

class  TechEventApp extends StatelessWidget {
  const  TechEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' TechEvent Indonesia',
      home:  TechEventHomePage(),
    );
  }
}

class  TechEventHomePage extends StatefulWidget {
  const  TechEventHomePage({super.key});

  @override
  State< TechEventHomePage> createState() => _TechEventHomePageState();
}

class _TechEventHomePageState extends State<TechEventHomePage> {
  // State untuk menyimpan jumlah presensi/aktivitas
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToDetail() {
    String namaEvent = 'Flutter Mobile Boot Camp';
    String hargaEvent = 'Rp 150.000';

    // Navigator.push untuk berpindah halaman sambil mengirim data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailData(nama: namaEvent, harga: hargaEvent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' TechEvent Indonesia')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.event_available, size: 80),
              const SizedBox(height: 16),
              const Text(
                ' TechEvent Indonesia',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Digital Educational Event Catalog'),
              const SizedBox(height: 8),
              Text(
                'Event Diikuti: $_counter',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                label: 'Ikuti Event Baru',
                icon: Icons.add_circle_outline,
                type: CustomButtonType.primary,
                onPressed: () {
                  _incrementCounter();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Mendaftar ke Event!'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                label: 'Lihat Detail Event',
                icon: Icons.calendar_today,
                type: CustomButtonType.secondary,
                onPressed: () {
                  _navigateToDetail();
                },
              ),
              const SizedBox(height: 12),
              CustomButton(
                label: 'Hubungi Penyelenggara',
                icon: Icons.mail_outline,
                type: CustomButtonType.tertiary,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sedang menghubungi penyelenggara...')),
                  );
                },
              ),
              const SizedBox(height: 12),
              const EventInfoCard(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
