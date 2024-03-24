
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/floor_model.dart';


ValueNotifier<List<FloorModel>>floorsettinglistnotifier=ValueNotifier([]);

Future<void> addsettingdetailsToDb(FloorModel value)async{
  final floordb=await Hive.openBox<FloorModel>('floor_db');
  int id = await floordb.add(value);
  log(id.toString());
  await getfloorsetting();
}

Future<void>getfloorsetting()async{
  final floordb=await Hive.openBox<FloorModel>('floor_db');
  floorsettinglistnotifier.value.clear();
  floorsettinglistnotifier.value.addAll(floordb.values);
  log(floorsettinglistnotifier.value.toString());
  // ignore: invalid_use_of_protected_member
  floorsettinglistnotifier.notifyListeners();
}