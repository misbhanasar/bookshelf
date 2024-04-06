import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';

ValueNotifier<List<Bookmodel>> booklistnotifier = ValueNotifier([]);

Future<void> addbook(Bookmodel value) async {
  final bookDB = await Hive.openBox<Bookmodel>('book_db');
  int id = await bookDB.add(value);
  value.id = id;
  await bookDB.put(id, value);
  await getallbooks();
}

Future<void> getallbooks() async {
  final bookDB = await Hive.openBox<Bookmodel>('book_db');
  booklistnotifier.value.clear();
  booklistnotifier.value.addAll(bookDB.values);
  booklistnotifier.notifyListeners();
}

Future<void> deletebookdetails(int id) async {
  final bookDB = await Hive.openBox<Bookmodel>('book_db');
  await bookDB.delete(id);
  getallbooks();
}

Future<void> updatebooks(Bookmodel editbook, int id) async {
  final bookDB = await Hive.openBox<Bookmodel>('book_db');
  try {
    await bookDB.put(id, editbook);
    await getallbooks();
  } catch (e) {
    log(e.toString());
  }
}

List<Bookmodel> searchbook(String query) {
  final bookDB = Hive.box<Bookmodel>("book_db");
  final List<Bookmodel> allbooks = bookDB.values.toList();

  if (query.isEmpty) {
    return allbooks;
  }

  final lowerCaseQuery = query.toLowerCase();
  return allbooks
      .where((book) =>
          book.bokname.toLowerCase().contains(lowerCaseQuery))
      .toList();
}
