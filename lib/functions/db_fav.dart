

import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';

Future<void> openFavouriteBox()async{
  await Hive.openBox<Bookmodel>('favourites');
}
void saveFavouriteBook(Bookmodel favbook)async{
final favouritebox=await Hive.openBox<Bookmodel>('favourites');
if(favouritebox.containsKey(favbook.bokname)){
  await favouritebox.delete(favbook.bokname);
}else{
  await favouritebox.put(favbook.bokname, favbook);
}
}