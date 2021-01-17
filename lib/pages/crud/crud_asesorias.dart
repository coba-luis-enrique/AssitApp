import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/model_mahasiswa.dart';
import '../detail_mahasiswa.dart';
import '../form_mahasiswa.dart';
import '../login_page.dart';
import '../../utils/db_helper.dart';

class HomeAsesoria extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeAsesoria> {
  String email = '';
  String username = '';
  List<ModelTutoria> listMahasiswa = [];
  DatabaseHelper db = DatabaseHelper();

  Future<void> _getAllMahasiswa() async {
    var list = await db.getAllMahasiswa();
    setState(() {
      listMahasiswa.clear();
      list.forEach((element) {
        listMahasiswa.add(ModelTutoria.fromMap(element));
      });
      print(list);
    });
  }

  Future<void> _deleteMahasiswa(ModelTutoria mahasiswa, int position) async {
    await db.deleteMahasiswa(mahasiswa.id);

    setState(() {
      listMahasiswa.removeAt(position);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormMahasiswa(),
      ),
    );

    if (result == 'save') {
      await _getAllMahasiswa();
    }
  }

  Future<void> _openFormEdit(ModelTutoria mahasiswa) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormMahasiswa(mahasiswa: mahasiswa),
      ),
    );

    if (result == 'update') {
      await _getAllMahasiswa();
    }
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      username = pref.getString('username');
      email = pref.getString('email');
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllMahasiswa();
    getDataPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MIS ASESORIAS'),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listMahasiswa.length,
          itemBuilder: (context, index) {
            ModelTutoria mahasiswa = listMahasiswa[index];

            return Column(
              children: [
                ListTile(
                  onTap: () {
                    // OPEN FORM EDIT
                    _openFormEdit(mahasiswa);
                  },
                  title:
                      Text("${mahasiswa.asesorName} ${mahasiswa.materiaName}"),
                  subtitle: Text("${mahasiswa.fechaName} | ${mahasiswa.email}"),
                  leading: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // DETAIL PAGE
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            mahasiswa: mahasiswa,
                          ),
                        ),
                      );
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      AlertDialog hapus = AlertDialog(
                        title: Text('Informations'),
                        content: Container(
                          height: 100,
                          child: Column(
                            children: [
                              Text(
                                "Apakah yakin ingin menghapus data ${mahasiswa.email} ?",
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              // DELETE
                              _deleteMahasiswa(mahasiswa, index);
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                      showDialog(context: context, child: hapus);
                    },
                  ),
                ),
                Divider(thickness: 2)
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }
}
