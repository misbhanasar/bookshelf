import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/style/colors.dart';

class Searchview extends StatefulWidget {

final Bookmodel data;
  
  const Searchview ({super.key,required this.data});

  @override
  State<Searchview> createState() => _CategorypageState();
}

class _CategorypageState extends State<Searchview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            
            height: 1000,
            width: 1000,
            
            decoration: const BoxDecoration(
              color: color.blue,
              ),
              child: const SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('BOOKDETAILS',style: TextStyle(color: color.white,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
             child: Container(
              height: 680,
              width: 700,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 254, 254, 254),borderRadius: BorderRadius.circular(34),
              ),
              ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 100),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                  children: [
                                Container(
                                   height: 170,
                                   width: 170,
                                 decoration: BoxDecoration(
                                   color: const Color.fromARGB(255, 10, 10, 10),
                                   borderRadius: BorderRadiusDirectional.circular(24)
                                 ),
                                   child: Image(image: FileImage(File(widget.data.imagepath)),),

                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 40),
                                   child: Text(widget.data.bokname,style: const TextStyle(fontWeight: FontWeight.bold),),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Text('authorname: ${widget.data.authorname}',),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Text('ShelfNumber:${widget.data.shelfnumber}'),
                                 ),
                                 Text('FloorNumber:${widget.data.floornumber}'),
                                 

                                 Padding(
                                   padding: const EdgeInsets.only(right: 30),
                                   child: Text('category:${widget.data.category}'),
                                 ),
                                 const Padding(
                                   padding: EdgeInsets.only(top: 10),
                                   child: Text('details  ',style: TextStyle(fontWeight: FontWeight.bold),),
                                 ),
                                 
                                 Text(widget.data.bookdetails)
                  ],
                  
                 ),
               ],
             ),
           ),
       
        ],
        
      ),
      
      
    );
  }
}