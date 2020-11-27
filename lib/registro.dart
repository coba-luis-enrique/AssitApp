import 'package:flutter/material.dart';
import 'login.dart';
import 'custominput.dart';


class Registro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.blue[800],
           body: SingleChildScrollView(
                        child: Stack(
               children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
             Padding(
               padding: const EdgeInsets.only(left: 1.0, right: 195.0, top: 15.0),
               child: Text('Registro', style: TextStyle(fontSize: 25, color: Colors.white, 
               fontWeight: FontWeight.bold)
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 1.0, right: 191.0, top: 5.0),
               child: Text('Ingresa los\nsiguientes datos:', style: TextStyle(fontSize: 13, color: Colors.white
               ),
                ),
             ),
             SizedBox(height: 7,),
             MiInputBox(
               label: 'Nombre',
               inputHint: 'Jose',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Apellido',
               inputHint: 'Pool',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Carrera',
               inputHint: 'Sistemas',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Semestre',
               inputHint: 'Quinto',
             ),
             SizedBox(height: 1,),
             MiInputBox(
               label: 'Matrícula',
               inputHint: '20070010',
             ),
             SizedBox(height: 2),
             Container(
                padding: EdgeInsets.all(2),
                child: RaisedButton(
                          child: Text('REGISTRARME', style: TextStyle(color: Colors.black, 
                          fontWeight: FontWeight.bold)
                             ),
                             onPressed: () {},
                              ),
             ),
             RichText(
               text: TextSpan(
                 children: [
                   TextSpan(
                     text: '¿Ya estás registrado?',
                     style: TextStyle(
                       fontSize: 15,
                       color: Colors.white
                     )
                   ),
                 ]
                 ),
             ),
             SizedBox(height: 5,),
             Container(
               padding: EdgeInsets.all(2),
               child: GestureDetector(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                 },
                 child: Text('Inicia Sesión', style: TextStyle(color: Colors.white,
                 fontWeight: FontWeight.bold
                 )
                 ),
               ),
             )
                      ],
                    
                    ),
                ClipPath(
                  clipper: OuterClippedPart(),
                  child: Container(
                    color: Colors.white,
                    width: scrWidth,
                    height: scrHeight,
                  ),
                )
          ],
        ),
           ),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper <Path>
  {
    @override
  Path getClip(Size size) {
      Path path = Path();
      path.moveTo(size.width / 2, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height / 4);
      return path;
    }
  
    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}