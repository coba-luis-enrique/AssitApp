import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/model_Tutoria.dart';
import 'detail_Tutoria.dart';
import 'form_Tutoria.dart';
import 'login_page.dart';
import '../utils/db_helper.dart';
import 'crud/crud_asesorias.dart';

class HomeAsesoriaDisp extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeAsesoriaDisp> {
  _HomePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          listTutoria = allCourses;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  String email = '';
  String username = '';
  List<ModelTutoria> listTutoria = [];
  DatabaseHelper db = DatabaseHelper();
  Icon _searchIcon = Icon(Icons.search);
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  // var listTutoria = List();
  List allCourses = new List();
  List items = List();

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
      return _getAllTutoria();
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
      db.getAllTutoria().then((data) {
        setState(() {
          allCourses = data;
          items = allCourses;
        });
      });
      //await _getAllTutoria();
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
    db.getAllTutoria().then((data) {
      setState(() {
        allCourses = data;
        items = allCourses;
      });
    });
  }

  void filterSearch(String query) {
    var searchList = allCourses;
    if (query.isNotEmpty) {
      var listData = List();
      searchList.forEach((item) {
        var tutoria = ModelTutoria.fromMap(item);
        if (tutoria.materiaName.toLowerCase().contains(query.toLowerCase())) {
          listData.add(item);
        }
      });
      setState(() {
        items = [];
        items.addAll(listData);
      });
      return;
    } else {
      setState(() {
        items = [];
        items = allCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ASESORIAS DISPONIBLES'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filterSearch(value);
                });
              },
              controller: _filter,
              decoration: InputDecoration(
                labelText: 'Buscar Asesoria',
                hintText: 'Buscando...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                ModelTutoria Tutoria = ModelTutoria.fromMap(items[index]);
                //ModelTutoria Tutoria = items[index];

                return ListTile(
                  onTap: () {
                    // OPEN FORM EDIT
                    _openFormEdit(Tutoria);
                  },
                  title: Text("${Tutoria.asesorName} | ${Tutoria.materiaName}"),
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
                                "¿Estás seguro de que quieres eliminar los datos? ${Tutoria.email} ?",
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              // DELETE
                              setState(() {
                                db.deleteTutoria(Tutoria.id);
                                Navigator.pop(context);
                                db.getAllTutoria().then((data) {
                                  setState(() {
                                    allCourses = data;
                                    items = allCourses;
                                  });
                                });
                              });
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

                  //Divider(thickness: 2),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
