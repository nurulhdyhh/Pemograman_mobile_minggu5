import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String _nama = '';
  String _gender = 'Laki-laki';
  bool _sudahBekerja = false;
  double _tinggiBadan = 170.0;
  List<String> _makananFavorit = [];
  String? _pekerjaanOrtu = 'Pegawai Swasta';
  String? _provinsiAsal;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _provinsiAsal = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _nama = value;
                        });
                      },
                      decoration: InputDecoration(labelText: 'Nama'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Text('Jenis Kelamin'),
                  Radio(
                    value: 'Laki-laki',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  const Text('Laki-laki'),
                  Radio(
                    value: 'Perempuan',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  const Text('Perempuan'),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text('Sudah Bekerja'),
                  Switch(
                    value: _sudahBekerja,
                    onChanged: (value) {
                      setState(() {
                        _sudahBekerja = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tinggi Badan: ${_tinggiBadan.toInt()} cm'),
                        Slider(
                          value: _tinggiBadan,
                          min: 100.0,
                          max: 200.0,
                          onChanged: (value) {
                            setState(() {
                              _tinggiBadan = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Makanan Favorit'),
                        CheckboxListTile(
                          title: const Text('Nasi Goreng'),
                          value: _makananFavorit.contains('Nasi Goreng'),
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                if (value) {
                                  _makananFavorit.add('Nasi Goreng');
                                } else {
                                  _makananFavorit.remove('Nasi Goreng');
                                }
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Sate'),
                          value: _makananFavorit.contains('Sate'),
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                if (value) {
                                  _makananFavorit.add('Sate');
                                } else {
                                  _makananFavorit.remove('Sate');
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _pekerjaanOrtu,
                      onChanged: (value) {
                        setState(() {
                          _pekerjaanOrtu = value;
                        });
                      },
                      items: ['Pegawai Swasta', 'Wiraswasta', 'PNS', 'Lainnya']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      decoration: const InputDecoration(
                          labelText: 'Pekerjaan Orang Tua'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _provinsiAsal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provinsi tidak boleh kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _provinsiAsal = value;
                        });
                      },
                      items:
                          ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Lainnya']
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                      decoration:
                          const InputDecoration(labelText: 'Provinsi Asal'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Show confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi'),
                          content: const Text('Apakah data sudah benar?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Data berhasil disimpan'),
                                  ),
                                );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
