import 'package:asesorias_flutter/pages/asesorias_disp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'crud/crud_asesorias.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'asesorias_disp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/model_Tutoria.dart';
import 'detail_Tutoria.dart';
import 'form_Tutoria.dart';
import '../utils/db_helper.dart';

class Home_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home_Page();
  }
}

class _Home_Page extends State<Home_Page> {
  String mainProfilePic =
      "https://i.pinimg.com/originals/3b/06/d1/3b06d1589ad977c87c25c9c3a86a5631.jpg";
  String otherProfilePic =
      "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/368-mj-2516-02.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f3d0ad657bbca1c0f2db36ad7deb323";

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

  //.. Switching Profile using multiple Accounts

  /*void switchUser(){
    String backupString = mainProfilePic;
    this.setState(() {
      mainProfilePic = otherProfilePic;
      otherProfilePic = backupString;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(begin: Alignment.topCenter, colors: [
      Colors.blue[900],
      Colors.blue[700],
    ]);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Inicio"),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 1.5,
        ),
        body: Column(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(color: Colors.blue[300]),
              //height: 70,
              // padding: EdgeInsets.all(10),
              //elevation: 1.5,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(15),
                      //height: MediaQuery.of(context).size.height * 0.25,
                      //width: MediaQuery.of(context).size.width * 0.10,
                      //margin: EdgeInsets.only(top: 10),
                      //padding: EdgeInsets.all(1),
                      child: Container(
                        child: Image.asset(
                          "assets/logo_itsva.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ), //CUADRO IMAGEN ASESORIAS
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerRight,
                      //width: MediaQuery.of(context).size.width * 0.70,
                      child: Text(
                        "INSTITUTO TECNOLOGICO SUPERIOR DE VALLADOLID",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                //width: double.infinity,
                //decoration: BoxDecoration(color: Colors.blue[300]),
                //padding: EdgeInsets.all(10),
                //elevation: 1.5
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                width: double.infinity,
                height: 70,
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '" Bienvenido a',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: ' AssistApp "',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  //decoration: BoxDecoration(gradient: linearGradient),
                  //height: 70,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      color: Colors.orangeAccent,
                      //color: LinearGradient,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 1.5,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              //height: MediaQuery.of(context).size.height * 0.25,
                              width: 280,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(15),
                              child: Container(
                                child: Image.asset(
                                  "assets/asesoriasDisponible.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ), //CUADRO IMAGEN ASESORIAS
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: MaterialButton(
                                  child: Text(
                                    "Asesorías disponibles",
                                    style: TextStyle(
                                        //fontSize: 20,
                                        //backgroundColor: Colors.white,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: Colors.blue[900],
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeAsesoriaDisp()));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  //height: 70,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 1.5,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: 250,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(15),
                              child: Container(
                                child: Image.asset(
                                  "assets/asesorias.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ), //CUADRO IMAGEN ASESORIAS
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: MaterialButton(
                                  child: Text(
                                    "Mis Asesorías",
                                    style: TextStyle(
                                        //fontSize: 20,
                                        //backgroundColor: Colors.white,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: Colors.blue[900],
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeAsesoria() //CAMBIAR CUANDO TENGAMOS EL MODULO DE ASESORIAS DIPONIBLES
                                            ));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )),
          ],
        ),
        drawer: new Drawer(
            child: Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text("$username"),
                      accountEmail: Text("$email"),
                      currentAccountPicture: GestureDetector(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(mainProfilePic),
                          ),
                          onTap: () => print("Current User")),

                      //.. This line of code provides the usage of multiple accounts
                      /* otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: ()=> switchUser(),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(otherProfilePic)
                ),
              ),
            ], */
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://i.pinimg.com/originals/51/03/c7/5103c761b07bf769be4a184a700a15c4.jpg")),
                      ),
                    ),
                    ListTile(
                        title: Text("Nueva Asesoria"),
                        trailing: Icon(Icons.add_circle_outline_sharp),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => FormTutoria(),
                          ));
                        }),
                    ListTile(
                        title: Text("Mis Asesorias"),
                        trailing: Icon(Icons.accessibility_new),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HomeAsesoria()));
                        }),
                    ListTile(
                        title: Text("Asesorias Disponibles"),
                        trailing: Icon(Icons.article_outlined),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HomeAsesoriaDisp()));
                        }),
                    Divider(
                      thickness: 1.0,
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Cerrar Sesión'),
                      onTap: logout,
                    ),
                  ],
                ))));
  }
}
