import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/functions/db_fav.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/bookdetails.dart';

import 'package:library_project/style/colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();

}


class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    super.initState();
    addFavouriteBook();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        title: const Text(
          'favourite',
          style: TextStyle(color: color.white, fontWeight: FontWeight.bold),
        ),
       
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: color.white
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  ),
              gradient: LinearGradient(colors: [
               Color.fromARGB(255, 5, 146, 234),
                Color.fromARGB(255, 159, 165, 169),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: booklistnotifier,
        builder: (BuildContext ctx, List<Bookmodel> list, Widget? child) {
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final data = list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Bookdetails(
                              data: data,
                            )));
                  },
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Column(
                        children: [
                          Row(
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
                                      image: DecorationImage(
                                          image:
                                              FileImage(File(data.imagepath)),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 100),
                                    child: Row(
                                      children: [
                                        Text(
                                          data.bokname,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 20),
                                  //   child: Divider(thickness:1,color: Colors.black,),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 80),
                                    child: Row(
                                      children: [
                                        Text(
                                          'AUTHOR NAME:           ${data.authorname}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // IconButton(onPressed: (){

                                      //   // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Editbookdetails(bokmodel: data,)));
                                      // },
                                      //  icon: const Padding(
                                      //    padding: EdgeInsets.only(left: 70),
                                      //    child: Icon(Icons.edit,color: Color.fromARGB(255, 174, 16, 5),size: 15,),
                                      //  )),Padding(
                                       Padding(
                                         padding: const EdgeInsets.only(top: 10,),
                                         child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.favorite_border,
                                          color: Color.fromARGB(255, 188, 6, 24),
                                          size: 20,)),
                                       ),

                                     

                                     
                                      
                                    ],
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ],
                      )),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}