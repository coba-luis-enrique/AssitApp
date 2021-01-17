import 'package:flutter/material.dart';
import '../model/model_mahasiswa.dart';

class DetailPage extends StatelessWidget {
  final ModelTutoria mahasiswa;
  DetailPage({this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${mahasiswa.asesorName}"),
            Text("${mahasiswa.materiaName}"),
            Text("${mahasiswa.fechaName}"),
            Text("${mahasiswa.matriculaName}"),
            Text("${mahasiswa.email}"),
          ],
        ),
      ),
    );
  }
}
