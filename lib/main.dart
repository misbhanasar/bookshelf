import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/model/floor_model.dart';
import 'package:library_project/screens/home.dart';
import 'package:library_project/screens/splashscrren.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if( !Hive.isAdapterRegistered(bookmodelAdapter().typeId))
 {
 Hive.registerAdapter(bookmodelAdapter());
 }
 if(!Hive.isAdapterRegistered(floormodelAdapter().typeId)){
  Hive.registerAdapter(floormodelAdapter());
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splashscreen(),
    );
  }
}

