import 'package:flutter/material.dart';
import '../model/model_mahasiswa.dart';
import '../utils/db_helper.dart';

class FormMahasiswa extends StatefulWidget {
  final ModelMahasiswa mahasiswa;

  FormMahasiswa({this.mahasiswa});

  @override
  _FormMahasiswaState createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  DatabaseHelper db = DatabaseHelper();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _jurusanController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.mahasiswa != null) {
      _firstNameController =
          TextEditingController(text: widget.mahasiswa.firstName);
      _lastNameController =
          TextEditingController(text: widget.mahasiswa.lastName);
      _jurusanController =
          TextEditingController(text: widget.mahasiswa.jurusan);
      _mobileNumberController =
          TextEditingController(text: widget.mahasiswa.mobileNumber);
      _emailController = TextEditingController(text: widget.mahasiswa.email);
    }
  }

  Future<void> createOrUpdateMahasiswa() async {
    if (widget.mahasiswa == null) {
      // create
      await db.saveMahasiswa(ModelMahasiswa(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        jurusan: _jurusanController.text,
        mobileNumber: _mobileNumberController.text,
        email: _emailController.text,
      ));
      Navigator.pop(context, 'save');
    } else {
      // update
      await db.updateMahasiswa(
        ModelMahasiswa.fromMap({
          'id': widget.mahasiswa.id,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'jurusan': _jurusanController.text,
          'mobileNumber': _mobileNumberController.text,
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
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Asesor',
                      ),
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Materia:',
                      ),
                    ),
                    TextFormField(
                      controller: _jurusanController,
                      decoration: InputDecoration(
                        labelText: 'fecha',
                      ),
                    ),
                    TextFormField(
                      controller: _mobileNumberController,
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
