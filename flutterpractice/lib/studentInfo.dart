import 'package:flutter/material.dart';

class StudentInfoList with ChangeNotifier {
  List<StudentInfo> infoList = [];

  void insertInfo(int num, String name) {
    infoList.add(StudentInfo(num, name));
    notifyListeners();
  }

  StudentInfo removeInfo(int index) {
    StudentInfo st = infoList.removeAt(index);
    notifyListeners();
    return st;
  }
}

class StudentInfo {
  int studentNo = 0;
  String studentName = "";

  StudentInfo(
    this.studentNo,
    this.studentName,
  );

  @override
  String toString() {
    // TODO: implement toString
    return '${studentName} (${studentNo})';
  }
}
