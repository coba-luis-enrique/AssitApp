import 'package:flutter/material.dart';
import 'custominput.dart';

class NuevaAsesoria extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        title:
          Text('Nueva Asesoría', style: TextStyle(color: Colors.white),),
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.blue[700],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            //       Padding(
            //    padding: const EdgeInsets.only(left: 1.0, right: 115.0, top: 15.0),
            //    child: Text('Nueva Asesoría', style: TextStyle(fontSize: 25, color: Colors.white, 
            //    fontWeight: FontWeight.bold)
            //    ),
            //  ),
             Padding(
               padding: const EdgeInsets.only(left: 1.0, right: 191.0, top: 5.0),
               child: Text('Ingresa los\nsiguientes datos:', style: TextStyle(fontSize: 13, color: Colors.white,
               fontWeight: FontWeight.bold
               ),
                ),
             ),
             SizedBox(height: 7,),
             MiInputBox(
               label: 'Asesor',
               inputHint: 'Jesús Tejero',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Materia',
               inputHint: 'Cálculo',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Fecha',
               inputHint: '',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Hora',
               inputHint: '',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Aula',
               inputHint: 'A1',
             ),
             SizedBox(height: 2),
             Container(
                padding: EdgeInsets.all(2),
                child: RaisedButton(
                          child: Text('CREAR', style: TextStyle(color: Colors.black, 
                          fontWeight: FontWeight.bold)
                             ),
                             onPressed: () {},
                              ),
             ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

