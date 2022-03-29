import 'package:flutterlearn/main.dart';
class Student{
  int id = 0;
  String firstName= "" ;
  String lastName="";
  int  grade=0;
  String? status;
  String ImgUrl="";

  Student(String firstName,String lastName, int grade,String ImgUrl){
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
    this.ImgUrl=ImgUrl;
  }
  Student.withId(int id,String firstName,String lastName, int grade,String ImgUrl){
    this.id=id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
    this.ImgUrl=ImgUrl;
  }
  String get getStatus{
    String message="";
    if(this.grade>=50){
      message="Geçti";
    }else if(this.grade>40){
      message="Bütünlemeye Kaldı";
    }else{
      message ="Kaldı";
    }
    return message;
  }
}