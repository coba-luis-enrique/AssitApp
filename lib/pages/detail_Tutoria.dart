import 'package:flutter/material.dart';
import '../model/model_Tutoria.dart';

class DetailPage extends StatelessWidget {
  final ModelTutoria Tutoria;
  DetailPage({this.Tutoria});

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
            Text("${Tutoria.asesorName}"),
            Text("${Tutoria.materiaName}"),
            Text("${Tutoria.fechaName}"),
            Text("${Tutoria.matriculaName}"),
            Text("${Tutoria.email}"),
          ],
        ),
      ),
    );
  }
}
