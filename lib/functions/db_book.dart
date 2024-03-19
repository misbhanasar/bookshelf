import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/editbook.dart';


ValueNotifier<List<bookmodel>>booklistnotifier=ValueNotifier([]);

Future<void> addbook(bookmodel value)async{
final bookDB =await Hive.openBox<bookmodel>('book_db');
int id = await bookDB.add(value);
value.id=id;
await bookDB.put(id,value);
await getallbooks();
}

Future<void>getallbooks()async{
  final bookDB =await Hive.openBox<bookmodel>('book_db');
  booklistnotifier.value.clear();
  booklistnotifier.value.addAll(bookDB.values);
booklistnotifier.notifyListeners();

}
Future<void>deletebookdetails(int id)async{
  final bookDB=await Hive.openBox<bookmodel>('book_db');
 await bookDB.delete(id);
 getallbooks();
}
Future<void>updatebooks(bookmodel editbook ,int id)async{
  
  final bookDB=await Hive.openBox<bookmodel>('book_db');
  try{
    await bookDB.put(id, editbook);
    await getallbooks();
  }catch(e){
    log(e.toString());
  }
}

