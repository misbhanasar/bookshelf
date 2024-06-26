

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/style/colors.dart';

class Comics extends StatefulWidget {
  const Comics({Key? key}) : super(key: key);

  @override
  State<Comics> createState() => _HorrorState();
}

class _HorrorState extends State<Comics> {
  late List<Bookmodel> comics = [];

  @override
  void initState() {
    super.initState();
    getbookbycategory();
    
  }

  Future<void> getbookbycategory() async {
    final bookDB = await Hive.openBox<Bookmodel>('book_db');
    final List<Bookmodel> books = [];
    await Future.forEach(bookDB.values, (Bookmodel values) {
      if (values.category == 'comics') {
        books.add(values);
      }
    });
    setState(() {
      comics = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        backgroundColor: color.blue,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('comics books',style: TextStyle(fontWeight: FontWeight.bold,color: color.white),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            final Bookmodel value = comics[index];
           
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image:FileImage(File(value.imagepath)),fit: BoxFit.cover),
                          color: const Color.fromARGB(255, 117, 114, 114),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(value.bokname),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1,),
                  Expanded(
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,right: 100),
                        child: Row(
                          children: [
                            Text(value.bokname,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 5,right:80),
                        child: Row(
                          children: [
                            Text('AUTHOR NAME:           ${value.authorname}',style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,right: 85),
                        child: Row(
                          children: [
                            Text('FLOOR NUMBER:          ${value.floornumber}',style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 10,right: 85,),
                        child: Row(
                          children: [
                            Text('SHELF NUMBER:           ${value.shelfnumber}',style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: comics.length,
        ),
      ),
    );
  }
}




// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:library_project/model/data_model.dart';

// class Horror extends StatefulWidget {
//   const Horror({Key? key}) : super(key: key);

//   @override
//   State<Horror> createState() => _HorrorState();
// }

// class _HorrorState extends State<Horror> {
//   late List<bookmodel> horror = [];

//   @override
//   void initState() {
//     super.initState();
//     getbookbycategory();
//   }

//   Future<void> getbookbycategory() async {
//     final bookDB = await Hive.openBox<bookmodel>('book_db');
//     final List<bookmodel> books = [];
//     await Future.forEach(bookDB.values, (bookmodel values) {
//       if (values.category == 'horror') {
//         books.add(values);
//       }
//     });
//     setState(() {
//       horror = books;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemBuilder: (ctx, index) {
//         final data = horror[index];
//         final bookmodel value = horror[index];
//         return conta
//         return ListTile(title: Text(value.bokname)); 
      
        
//       },
      
      
//       separatorBuilder: (ctx, index) {
        
//         // Here you can return a separator widget.
//         // Example: return Divider();
//         return Divider(); // Example
//       },
//       itemCount: horror.length, // Corrected
      
//     );
    
    
//   }
 
  
  
// }
