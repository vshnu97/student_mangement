
import 'package:hive_flutter/adapters.dart';
part 'model_class.g.dart';


@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  String id;
 
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String age;
 
  @HiveField(3)
  String batch;
 
  @HiveField(4)
  String domain;

  @HiveField(5)
  String image;

StudentModel({
  required this.age,required this.batch,
  required this.image,required this.domain,required this.id,required this.name
  
});


}
