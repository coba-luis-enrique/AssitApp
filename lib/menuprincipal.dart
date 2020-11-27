import 'package:flutter/material.dart';
import 'login.dart';
import 'nuevaasesoria.dart';
import 'asesoriasdisp.dart';
import 'misasesorias.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.blue[900],
                    Colors.blue[700],
                  ]
              );
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              gradient: linearGradient
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 5,),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/logo_itsva.png', scale: 2.0,),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 25,),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NuevaAsesoria()));
                            },
                            icon: Icon(Icons.add_circle_outline_sharp),
                            color: Colors.white,
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 30,),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.article_outlined),
                            color: Colors.white,
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20,),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Misasesorias()));
                            },
                            icon: Icon(Icons.accessibility_new),
                            color: Colors.white,
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20,),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            icon: Icon(Icons.close),
                            color: Colors.white,
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 13,),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('HOLA', style: TextStyle(color: Colors.white, fontSize: 25),),
                      SizedBox(height: 10,),
                      Text('FULANO MENGANO', style: TextStyle(color: Colors.white, fontSize: 13),),
                      SizedBox(height: 82,),
                      Row(
                        children: [
                          SizedBox(width: 1,),
                          Text('NUEVA ASESORIA', style: TextStyle(color: Colors.white, fontSize: 13),),
                        ],
                      ),
                      SizedBox(height: 53,),
                      Row(
                        children: [
                          SizedBox(width: 1,),
                          Text('ASESORIAS DISPONIBLES', style: TextStyle(color: Colors.white, fontSize: 13),),
                        ],
                      ),
                      SizedBox(height: 55,),
                      Row(
                        children: [
                          SizedBox(width: 1,),
                          Text('MIS ASESORIAS', style: TextStyle(color: Colors.white, fontSize: 13),),
                        ],
                      ),
                      SizedBox(height: 57,),
                      Row(
                        children: [
                          SizedBox(width: 1,),
                          Text('CERRAR SESIÓN', style: TextStyle(color: Colors.white, fontSize: 13),),
                        ],
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
    );
  }
}


