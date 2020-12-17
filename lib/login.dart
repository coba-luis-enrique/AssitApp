import 'package:asesorias_flutter/homepage.dart';
import 'package:flutter/material.dart';
import 'menuprincipal.dart';
import 'registro.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[900],
              Colors.blue[700],
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: EdgeInsets.all(11),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo_itsva.png',
                        scale: 2.0,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '¡BIENVENIDO!',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          //padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue[900],
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Ingresa tu matrícula',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                child: Divider(
                                  color: Colors.grey,
                                  height: 5,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                child: TextField(
                                  obscureText: true,
                                  obscuringCharacter: '●',
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Ingresa tu contraseña',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          child: RaisedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                            ),
                            label: Text(
                              'INICIAR SESIÓN',
                              style: TextStyle(color: Colors.black),
                            ),
                            //color: Colors.blue[700],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'Ó',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: RaisedButton(
                            child: Text('REGÍSTRATE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registro()));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )
          /*Center(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.accessibility),
            color: Colors.blue,
          ),
          */ /*child: RaisedButton.icon(
            onPressed: () {
              print('clicked me');
            },
            icon: Icon(
                Icons.account_circle
            ),
            label: Text('INICIAR SESIÓN'),
            color: Colors.white,
          ),*/ /*
          //child: Image.asset('assets/foto_asesoria_nueva.png'),
          // child: Text('¡Bienvenido!',
          // style: TextStyle(
          // fontSize: 20.0,
          // fontWeight: FontWeight.bold,
          // color: Colors.black,
          // ),
          //     ),
        ),*/

          ),
    );
  }
}
