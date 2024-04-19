

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';

ValueNotifier<List<Bookmodel>> favouritebooklistnotifier = ValueNotifier([]);
Future<void>addFavouriteBook()async{
  
final  bookDB=await Hive.openBox<Bookmodel>('book_db');
favouritebooklistnotifier.value.clear();
Future.forEach(bookDB.values, (element) {
  if(element.favorite==true){
    favouritebooklistnotifier.value.add(element);
  }
  
});
favouritebooklistnotifier.notifyListeners();
}

Future<void>addFavourite(String id)async{
  final bookDB=await Hive.openBox<Bookmodel>('book_db');
Bookmodel? data=bookDB.get(int.parse(id));
  data?.favorite=true;
  await bookDB.put(int.parse(id), data!);
  addFavouriteBook();
}

Future<void>removeFavourite(String id)async{
  final bookDB=await Hive.openBox<Bookmodel>('book_db');
Bookmodel? data=bookDB.get(int.parse(id));
  data?.favorite=false;
  await bookDB.put(int.parse(id), data!);
  addFavouriteBook();
}

 






// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:library_project/model/data_model.dart';

// Future<void> openFavouriteBox()async{
//   await Hive.openBox<Bookmodel>('favourites');
// }
// void saveFavouriteBook(Bookmodel favbook)async{
// final favouritebox=await Hive.openBox<Bookmodel>('favourites');
// if(favouritebox.containsKey(favbook.bokname)){
//   await favouritebox.delete(favbook.bokname);
// }else{
//   await favouritebox.put(favbook.bokname, favbook);
// }
// }

