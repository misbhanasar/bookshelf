import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';


ValueNotifier<List<bookmodel>>booklistnotifier=ValueNotifier([]);

Future<void> addbook(bookmodel value)async{
final bookDB =await Hive.openBox<bookmodel>('book_db');
bookDB.add(value);
booklistnotifier.value.add(value);
 booklistnotifier.notifyListeners();
}

Future<void>getallbooks()async{
  final bookDB =await Hive.openBox<bookmodel>('book_db');
  booklistnotifier.value.clear();
  booklistnotifier.value.addAll(bookDB.values);
booklistnotifier.notifyListeners();

}

