import 'package:flutter/material.dart';
import '../model/model_Tutoria.dart';
import '../utils/db_helper.dart';

class FormTutoria extends StatefulWidget {
  final ModelTutoria Tutoria;

  FormTutoria({this.Tutoria});

  @override
  _FormTutoriaState createState() => _FormTutoriaState();
}

class _FormTutoriaState extends State<FormTutoria> {
  DatabaseHelper db = DatabaseHelper();

  TextEditingController _asesorNameController = TextEditingController();
  TextEditingController _materiaNameController = TextEditingController();
  TextEditingController _fechaNameController = TextEditingController();
  TextEditingController _matriculaNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.Tutoria != null) {
      _asesorNameController =
          TextEditingController(text: widget.Tutoria.asesorName);
      _materiaNameController =
          TextEditingController(text: widget.Tutoria.materiaName);
      _fechaNameController =
          TextEditingController(text: widget.Tutoria.fechaName);
      _matriculaNameController =
          TextEditingController(text: widget.Tutoria.matriculaName);
      _emailController = TextEditingController(text: widget.Tutoria.email);
    }
  }

  Future<void> createOrUpdateTutoria() async {
    if (widget.Tutoria == null) {
      // create
      await db.saveTutoria(ModelTutoria(
        asesorName: _asesorNameController.text,
        materiaName: _materiaNameController.text,
        fechaName: _fechaNameController.text,
        matriculaName: _matriculaNameController.text,
        email: _emailController.text,
      ));
      Navigator.pop(context, 'save');
    } else {
      // update
      await db.updateTutoria(
        ModelTutoria.fromMap({
          'id': widget.Tutoria.id,
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
                        createOrUpdateTutoria();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: widget.Tutoria == null
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