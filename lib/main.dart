import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/functions/db_floorshelf.dart';
import 'package:library_project/functions/db_user.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/model/floor_model.dart';
import 'package:library_project/model/user_model.dart';
import 'package:library_project/screens/splashscrren.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if( !Hive.isAdapterRegistered(BookmodelAdapter().typeId))
 {
 Hive.registerAdapter(BookmodelAdapter());
 }
 if(!Hive.isAdapterRegistered(FloorModelAdapter().typeId)){
  Hive.registerAdapter(FloorModelAdapter());
 }
 if (!Hive.isAdapterRegistered(UsermodelAdapter().typeId)) {
   Hive.registerAdapter(UsermodelAdapter());
  
 }
 
 await getfloorsetting();
 await getallbooks();
 await getuser();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


@override
  void initState() {
    super.initState();
   
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}

