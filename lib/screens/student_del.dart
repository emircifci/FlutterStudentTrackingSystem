import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/models/student.dart';

class StudentDel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StudentDel();
  }

}
class _StudentDel extends State<StudentDel>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelleme"),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      )



    );
  }

}