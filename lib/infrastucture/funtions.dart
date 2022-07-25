import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/domain/model/model_class.dart';

abstract class StudentDb {
  Future<void> addStudentDetails(StudentModel value);
  Future<void> getStudentDetails();
  Future<void> deleteStudentDetals(String id);
  Future<void> editStudentDetails(StudentModel obj);
}

class DbFuntions extends StudentDb with ChangeNotifier {
  final List<StudentModel> allStudentList = [];
  @override
  Future<void> addStudentDetails(StudentModel value) async {
    final studentDatabase = await Hive.openBox<StudentModel>('hive_DB');
    await studentDatabase.put(value.id, value);
  }

  @override
  Future<void> deleteStudentDetals(String id) async {
    final studentDatabase = await Hive.openBox<StudentModel>('hive_DB');
    studentDatabase.delete(id);
    getStudentDetails();
  }

  @override
  Future<void> editStudentDetails(StudentModel obj) async {
    final studentDatabase = await Hive.openBox<StudentModel>('hive_DB');
    studentDatabase.put(obj.id, obj);
  }

  @override
  Future<void> getStudentDetails() async {
    final studentDatabase = await Hive.openBox<StudentModel>('hive_DB');
    allStudentList.clear();
    allStudentList.addAll(studentDatabase.values.toList().reversed);
   
    notifyListeners();
  }
}
