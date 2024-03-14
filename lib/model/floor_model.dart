import 'package:hive/hive.dart';
part 'floor_model.g.dart';

@HiveType(typeId:0 )
class FloorModel extends HiveObject{
 
  @HiveField(1)
  final String floornumbersetting;
  @HiveField(2)
  final String shelfnumbersetting;


  FloorModel({
  required this.floornumbersetting,
  required this.shelfnumbersetting,
  });
}