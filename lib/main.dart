import 'package:flutter/material.dart';
import 'package:flutterlearn/models/student.dart';
import 'package:flutterlearn/screens/student_add.dart';
import 'package:flutterlearn/screens/student_del.dart';

void main() => runApp(MyApp());
final Color darkblue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkblue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List students = [
    Student.withId(1, "emir", "çifçi", 25,"https://www.trthaber.com/resimler/1122000/1122617.jpg"),
    Student.withId(2, "berkay", "çifçi", 45,"https://i2.wp.com/www.protopars.com/wp-content/uploads/2019/04/%C3%B6%C4%9Frenciler.jpg?fit=1875%2C1875&ssl=1"),
    Student.withId(3, "suna", "çifçi", 95,"https://4.bp.blogspot.com/-MINDN5J373A/VkfQnHz-wiI/AAAAAAAAcqw/ZM2zhFXCmL4/s1600/ogrenci_universite_ogrencisi.jpg"),
  ];

  Student selectedStudent = Student.withId(0, "Hiç Kimse", " ", 0, " ");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci takip sistemi"),
        ),
        body: builBody());
  }

  builBody() {
    return Column(children: [
      Expanded(
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Sınavdan aldıgı not: " +
                    students[index].grade.toString() +
                    "[" +
                    students[index].getStatus +
                    "]"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(students[index].ImgUrl),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    this.selectedStudent = students[index];

                  });
                },
              );
            }),
      ),
      Text("Seçilen öğrenci:" + selectedStudent.firstName),
      Row(children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentAdd(students)));
            },
            child: Row(
              children: [Icon(Icons.add), Text("Yeni öğrenci")],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentDel()));
            },
            child: Row(
              children: [Icon(Icons.add), Text("Güncelle")],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
            onPressed: () {
              students.remove(selectedStudent);

            },
            child: Row(
              children: [Icon(Icons.add), Text("Sil")],
            ),
          ),
        ),
      ])
    ]);
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
