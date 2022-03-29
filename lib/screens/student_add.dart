import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<dynamic> students;
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddStade();
  }
}

class _StudentAddStade extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", 0,"");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni öğrenci ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Öğrenci Adı", hintText: "Emir"),
                  onChanged: (value) {
                    setState(() {
                      student.firstName = value;
                    });
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: "Öğrenci Soyadı", hintText: "Çifçi"),
                    onChanged: (value) {
                      setState(() {
                        student.lastName = value;
                      });
                    }),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: "not", hintText: "100"),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      student.grade = int.parse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration:
                  InputDecoration(labelText: "resim url", hintText: "url"),

                  onChanged: (value) {
                    setState(() {
                      student.ImgUrl = value;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("Kaydet"),
                  onPressed: () {
                    widget.students.add(student);
                    Navigator.pop(context);
                  }),
              ],
            ),
          ),
        ));
  }
}
