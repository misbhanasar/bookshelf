
import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class bookmodel extends HiveObject {
  @HiveField(1)
  final String bokname;
 @HiveField(2)
 final String authorname;
 @HiveField(3)
 final String floornumber;
 @HiveField(4)
 final String shelfnumber;
 @HiveField(5)
 final String bookdetails;
 @HiveField(6)
 final String imagepath;
  


  bookmodel({required this.bokname,
  required this.authorname,
  required this.floornumber,
  required this.shelfnumber,
  required this.bookdetails,
  required this.imagepath,
  });
}
