import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/model_Tutoria.dart';
import '../detail_Tutoria.dart';
import '../form_Tutoria.dart';
import '../login_page.dart';
import '../../utils/db_helper.dart';

class HomeAsesoria extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeAsesoria> {
  String email = '';
  String username = '';
  List<ModelTutoria> listTutoria = [];
  DatabaseHelper db = DatabaseHelper();

  Future<void> _getAllTutoria() async {
    var list = await db.getAllTutoria();
    setState(() {
      listTutoria.clear();
      list.forEach((element) {
        listTutoria.add(ModelTutoria.fromMap(element));
      });
      print(list);
    });
  }

  Future<void> _deleteTutoria(ModelTutoria Tutoria, int position) async {
    await db.deleteTutoria(Tutoria.id);

    setState(() {
      listTutoria.removeAt(position);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormTutoria(),
      ),
    );

    if (result == 'save') {
      await _getAllTutoria();
    }
  }

  Future<void> _openFormEdit(ModelTutoria Tutoria) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormTutoria(Tutoria: Tutoria),
      ),
    );

    if (result == 'update') {
      await _getAllTutoria();
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
    _getAllTutoria();
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
          itemCount: listTutoria.length,
          itemBuilder: (context, index) {
            ModelTutoria Tutoria = listTutoria[index];

            return Column(
              children: [
                ListTile(
                  onTap: () {
                    // OPEN FORM EDIT
                    _openFormEdit(Tutoria);
                  },
                  title: Text("${Tutoria.asesorName} ${Tutoria.materiaName}"),
                  subtitle: Text("${Tutoria.fechaName} | ${Tutoria.email}"),
                  leading: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // DETAIL PAGE
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            Tutoria: Tutoria,
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
                                "Apakah yakin ingin menghapus data ${Tutoria.email} ?",
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              // DELETE
                              _deleteTutoria(Tutoria, index);
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
