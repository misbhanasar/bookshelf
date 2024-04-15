

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/model/data_model.dart';

ValueNotifier<List<Bookmodel>> favouritebooklistnotifier = ValueNotifier([]);
Future<void>addFavouriteBook()async{
final  bookDB=await Hive.openBox<Bookmodel>('book_db');
favouritebooklistnotifier.value.clear();
Future.forEach(bookDB.values, (element) {
  if(element.favorite==true){
    booklistnotifier.value.add(element);
  }
  
});
favouritebooklistnotifier.notifyListeners();
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

