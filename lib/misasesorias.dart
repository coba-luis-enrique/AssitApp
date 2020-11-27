import 'package:flutter/material.dart';

class Misasesorias extends StatefulWidget {
  @override
  _MisasesoriasState createState() => _MisasesoriasState();
}


class _MisasesoriasState extends State<Misasesorias> {

  List <String> asesorias = [ 'Cálculo','Física', 'Álgebra', 'Taller de Ética'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title:
          Text('Mis Asesorías', style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: asesorias.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                    child: ListTile(
                      title: Text(asesorias[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){},
                        color: Colors.grey,
                      ),
              ),
              ),
            );
          }
    )
    );
  }
}
