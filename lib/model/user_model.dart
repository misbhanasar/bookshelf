import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 2)
class Usermodel extends HiveObject{
@HiveField(1)
int? id;
@HiveField(2)
final String name;
@HiveField(3)
final String phnonenumber;
@HiveField(4)
final String address;
@HiveField(5)
final String bookname;
@HiveField(6)
final String collecteddate;
@HiveField(7)
final String duedate;


Usermodel({
  required this.name,
  required this.phnonenumber,
  required this.address,
  required this.bookname,
  required this.collecteddate,
  required this.duedate,
  this.id
});
}