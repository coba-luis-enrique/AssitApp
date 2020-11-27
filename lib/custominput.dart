import 'package:flutter/material.dart';

class MiInputBox extends StatefulWidget {
  String label;
  String inputHint;
  MiInputBox({this.label, this.inputHint});

  @override
  _MiInputBoxState createState() => _MiInputBoxState();
}

class _MiInputBoxState extends State<MiInputBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Align(
           alignment: Alignment.centerLeft,
           child: Padding(
             padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
             child: Text(
               widget.label,
               style: TextStyle(
                 fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold
               ),
             ),
             ),
         ),
         Padding(
           padding: const EdgeInsets.fromLTRB(10,0,80,15),
           child: TextFormField(
             style: TextStyle(
               fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold
             ),
             decoration: InputDecoration(
               hintText: widget.inputHint,
               hintStyle: TextStyle(
               fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold
             ),
             contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
             focusColor: Colors.white, focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20),
               borderSide: BorderSide(color: Colors.blue) 
               ),
               enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20),
               borderSide: BorderSide(color: Colors.grey) 
               ),
             ),
           ),
         )
       ],
    );
  }
}