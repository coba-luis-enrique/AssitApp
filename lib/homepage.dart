import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'otherpage.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'nuevaasesoria.dart';
import 'asesoriasdisp.dart';
import 'misasesorias.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  String mainProfilePic =
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  String otherProfilePic =
      "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/368-mj-2516-02.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f3d0ad657bbca1c0f2db36ad7deb323";

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
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          title: Text("AssistApp"),
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
                        "INSTITUTO TECENOLOGICO SUPERIOR DE VALLADOLID",
                        style: TextStyle(fontSize: 20),
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
              child: Text(
                "¡BIENVENIDO A ASSISTAPP!",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  //height: 70,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      elevation: 1.5,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: 280,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(15),
                              child: Container(
                                child: Image.asset(
                                  "assets/asesorias.jpg",
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
                                  child: Text("MIS ASESORIAS"),
                                  color: Colors.orangeAccent,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Misasesorias()));
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
                      elevation: 1.5,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
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
                                  child: Text("ASESORIAS DISPONIBLES"),
                                  color: Colors.orangeAccent,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Misasesorias() //CAMBIAR CUANDO TENGAMOS EL MODULO DE ASESORIAS DIPONIBLES
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
                color: Colors.blue[100],
                child: ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text("John Doe"),
                      accountEmail: Text("johndoe@email.com"),
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
                                "https://i.pinimg.com/originals/ac/62/6e/ac626e6c72aff0119e609be0438af8fe.jpg")),
                      ),
                    ),
                    ListTile(
                        title: Text("Nueva Asesoria"),
                        trailing: Icon(Icons.add_circle_outline_sharp),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => NuevaAsesoria(),
                          ));
                        }),
                    ListTile(
                        title: Text("Mis Asesorias"),
                        trailing: Icon(Icons.accessibility_new),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Misasesorias()));
                        }),
                    ListTile(
                        title: Text("Asesorias Disponibles"),
                        trailing: Icon(Icons.article_outlined),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Misasesorias()));
                        }),
                    Divider(
                      thickness: 1.0,
                    ),
                    ListTile(
                      title: Text("Close"),
                      trailing: Icon(Icons.cancel),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ))));
  }
}
