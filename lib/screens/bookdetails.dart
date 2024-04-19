import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/editbook.dart';

import 'package:library_project/style/colors.dart';

class Bookdetails extends StatefulWidget {
  final Bookmodel data;

  const Bookdetails({super.key, required this.data});

  @override
  State<Bookdetails> createState() => _CategorypageState();
}

class _CategorypageState extends State<Bookdetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text('BOOK DETAILS',style: TextStyle(color: color.white,fontWeight: FontWeight.bold),),
       actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Editbookdetails(bokmodel: widget.data,)));
              },
              icon: const Icon(
                Icons.edit,
                color: color.white,
              )),
       ],
              centerTitle: true,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 251, 251)),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 130,
                  color: Color.fromARGB(255, 212, 209, 209),
                  child: Image(image: FileImage(File(widget.data.imagepath))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Card(
                      child: Container(
                        height: 500,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'BOOK NAME:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                           
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'AUTHOR NAME:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                           
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'FLOOR NUMBER:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'SHELF NUMBER:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                           
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'CATEGORY:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                             Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'BOOK DETAILS:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Card(
              child: Container(
                height: 500,
                width: 166,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 251, 251),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data.bokname),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SelectableText(
                            widget.data.authorname,
                          ),
                         
                        ],
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data.floornumber),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data.shelfnumber),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data.category),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.data.bookdetails),
                    ),
                    
                  ],
                ),
              ),
            ),
                  ],
                ),
              ),
            ],
          ),
          
        ),
      ),
      
      
    //     body: Stack(children: [
    //   Container(
    //     height: 1000,
    //     width: 1000,
    //     decoration: const BoxDecoration(
    //       color: color.blue,
    //     ),
    //     child: SafeArea(
    //       child: Align(
    //         alignment: Alignment.topCenter,
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 IconButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     icon: const Padding(
    //                       padding: EdgeInsets.only(right: 100, top: 20),
    //                       child: Icon(
    //                         Icons.arrow_back,
    //                         color: color.white,
    //                       ),
    //                     )),
    //                 const Padding(
    //                   padding: EdgeInsets.only(right: 130, top: 20),
    //                   child: Text(
    //                     'BOOKDETAILS',
    //                     style: TextStyle(
    //                         color: color.white, fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 330),
    //               child: IconButton(
    //                   onPressed: () {
    //                     Navigator.of(context).push(MaterialPageRoute(
    //                         builder: (ctx) =>
    //                             Editbookdetails(bokmodel: widget.data)));
    //                   },
    //                   icon: const Icon(
    //                     Icons.edit,
    //                     size: 20,
    //                     color: Color.fromARGB(255, 254, 254, 254),
    //                   )),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
      
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100),
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 100),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               Container(
    //                 height: 170,
    //                 width: 170,
    //                 decoration: BoxDecoration(
    //                     border: Border.all(color: Colors.black),
    //                     color: const Color.fromARGB(255, 0, 0, 0),
    //                     borderRadius: BorderRadiusDirectional.circular(24)),
    //                 child: Image(
    //                   image: FileImage(File(widget.data.imagepath)),
    //                 ),
    //               ),
    //               SizedBox(width: 10,),
                  
                  
              
    //         ],
            
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 20,right: 250),
    //         child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Container(
    //                       height: 100,
    //                       width:1000,
                          
    //                                   decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 color: const Color.fromARGB(255, 234, 229, 229),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(top: 20, ),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text('NAME:'),
    //                         ],
    //                       ),
    //                     ),
    //                     )
    //                   ],
    //                 ),
    //       )
    //         ]
    //     ),
        
    //   ),
    
    //   )
    // ],
        
    
    // ),
    
    );
  }
}
