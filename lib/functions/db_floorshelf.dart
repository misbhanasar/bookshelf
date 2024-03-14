
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/model/floor_model.dart';


ValueNotifier<List<floormodel>>floorsettinglistnotifier=ValueNotifier([]);

Future<void> addsettingdetails(floormodel value)async{
  final floordb=await Hive.openBox<floormodel>('floor_db');
  floordb.add(value);
  floorsettinglistnotifier.value.add(value);
floorsettinglistnotifier.notifyListeners();
}

Future<void>getfloorsetting()async{
  final floordb=await Hive.openBox<floormodel>('floor_db');
  floorsettinglistnotifier.value.clear();
  floorsettinglistnotifier.value.addAll(floordb.values);
  floorsettinglistnotifier.notifyListeners();
}