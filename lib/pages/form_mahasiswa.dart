import 'package:flutter/material.dart';
import '../model/model_mahasiswa.dart';
import '../utils/db_helper.dart';

class FormMahasiswa extends StatefulWidget {
  final ModelTutoria mahasiswa;

  FormMahasiswa({this.mahasiswa});

  @override
  _FormMahasiswaState createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  DatabaseHelper db = DatabaseHelper();

  TextEditingController _asesorNameController = TextEditingController();
  TextEditingController _materiaNameController = TextEditingController();
  TextEditingController _fechaNameController = TextEditingController();
  TextEditingController _matriculaNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.mahasiswa != null) {
      _asesorNameController =
          TextEditingController(text: widget.mahasiswa.asesorName);
      _materiaNameController =
          TextEditingController(text: widget.mahasiswa.materiaName);
      _fechaNameController =
          TextEditingController(text: widget.mahasiswa.fechaName);
      _matriculaNameController =
          TextEditingController(text: widget.mahasiswa.matriculaName);
      _emailController = TextEditingController(text: widget.mahasiswa.email);
    }
  }

  Future<void> createOrUpdateMahasiswa() async {
    if (widget.mahasiswa == null) {
      // create
      await db.saveMahasiswa(ModelTutoria(
        asesorName: _asesorNameController.text,
        materiaName: _materiaNameController.text,
        fechaName: _fechaNameController.text,
        matriculaName: _matriculaNameController.text,
        email: _emailController.text,
      ));
      Navigator.pop(context, 'save');
    } else {
      // update
      await db.updateMahasiswa(
        ModelTutoria.fromMap({
          'id': widget.mahasiswa.id,
          'asesorName': _asesorNameController.text,
          'materiaName': _materiaNameController.text,
          'fechaName': _fechaNameController.text,
          'matriculaName': _matriculaNameController.text,
          'email': _emailController.text,
        }),
      );
      Navigator.pop(context, 'update');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nueva Asesoria'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _asesorNameController,
                      decoration: InputDecoration(
                        labelText: 'Asesor',
                      ),
                    ),
                    TextFormField(
                      controller: _materiaNameController,
                      decoration: InputDecoration(
                        labelText: 'Materia:',
                      ),
                    ),
                    TextFormField(
                      controller: _fechaNameController,
                      decoration: InputDecoration(
                        labelText: 'fecha',
                      ),
                    ),
                    TextFormField(
                      controller: _matriculaNameController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Matricula ',
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Correo Institucional',
                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: () {
                        createOrUpdateMahasiswa();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: widget.mahasiswa == null
                          ? Text('Create')
                          : Text('Update'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
