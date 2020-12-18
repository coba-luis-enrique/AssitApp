import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Asesoriasdisp extends StatefulWidget {
  @override
  _AsesoriasdispState createState() => _AsesoriasdispState();
}

class _AsesoriasdispState extends State<Asesoriasdisp> {
  List<String> asesorias = ['Cálculo', 'Física', 'Álgebra', 'Taller de Ética'];
  List<String> alcance = [
    'Ecuaciones',
    'Conversiones',
    'Imaginarios',
    'Entrevistas'
  ];
  //List<String> espacio = ['3/20', '12/20', '18/20', '2/20'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: Text(
            'Asesorias disponibles',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: asesorias.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(asesorias[index]),
                      subtitle: Text(alcance[index]),
                      trailing: Wrap(
                        children: [
                          RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.assignment_ind_sharp),
                            label: Text('7/10'),
                            color: Colors.grey,
                          ),
                          RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.assignment_late_sharp),
                            label: Text('info'),
                            color: Colors.grey,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_sharp),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
