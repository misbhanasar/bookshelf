import 'package:hive/hive.dart';
part 'floor_model.g.dart';

@HiveType(typeId:1 )
class floormodel{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String floornumbersetting;
  @HiveField(2)
  final String shelfnumbersetting;


  floormodel({required this.id,required this.floornumbersetting,required this.shelfnumbersetting});
}