import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  String luas = '';
  String keliling = '';

  @override
  void dispose() {
    panjangController.dispose();
    lebarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persegi Panjang',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Persegi Panjang'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Masukkan Panjang:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: panjangController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Masukkan Lebar:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: lebarController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    hitungLuasDanKeliling();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue), // Warna latar belakang tombol
                  ),
                  child: Text(
                    'Hitung',
                    style: TextStyle(color: Colors.white), // Warna teks tombol
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Luas: $luas',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Keliling: $keliling',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void hitungLuasDanKeliling() {
    double panjang = double.parse(panjangController.text);
    double lebar = double.parse(lebarController.text);

    double luasResult = panjang * lebar;
    double kelilingResult = 2 * (panjang + lebar);

    setState(() {
      luas = luasResult.toString();
      keliling = kelilingResult.toString();
    });
  }
}
