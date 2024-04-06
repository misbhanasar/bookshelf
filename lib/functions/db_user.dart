import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/user_model.dart';

ValueNotifier<List<Usermodel>> usernotifier = ValueNotifier([]);

Future<void> adduserfunction(Usermodel value) async {
  try {
    final userDB = await Hive.openBox<Usermodel>('user_db');
  int id = await userDB.add(value);
  value.id = id;
  await userDB.put(value.id, value);
  usernotifier.notifyListeners();
  } catch (e) {
    print(e);
  }
}

Future<void> getuser() async {
  final userdb = await Hive.openBox<Usermodel>('user_db');
  usernotifier.value.clear();
  usernotifier.value.addAll(userdb.values);
  usernotifier.notifyListeners();
}
Future<void>updateuser(Usermodel edituser,int id)async{
final userdb=await Hive.openBox<Usermodel>('user_db');
await userdb.put(id,edituser);
await getuser();

}
Future<void>deleteuser(int id)async{
final userdb=await Hive.openBox<Usermodel>('user_db');
await userdb.delete(id);
getuser();
}
