import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/addbook.dart';
import 'package:library_project/screens/settings.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key?key}): super(key:key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallbooks();
    
  }

  

  
  Widget build(BuildContext context) {
    getallbooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 15, left: 20, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 3),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            'BOOKSHELF',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        
                        IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>settings()));
                        },
                         icon: Padding(
                           padding: const EdgeInsets.only(left: 82,),
                           child: Icon(Icons.settings,color: Colors.white,size: 20,),
                         ))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  width: 360,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search here.....',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0, // Remove elevation for a flat look
          backgroundColor: Colors.transparent, // Set background color to transparent
        ),
      ),
     
      body: ValueListenableBuilder(
            valueListenable: booklistnotifier,
            builder:(BuildContext ctx , List<bookmodel>list, Widget? child){
           return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
              final data = list[index];
              return  SizedBox(
            height: 190,
            width: double.infinity,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                child:Row(
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
                            image: DecorationImage(image:FileImage(File(data.imagepath)),fit: BoxFit.cover),
                          ),
                          
                   
                          
                        ),
                      
                      ),
                      
                    ),
                SizedBox(width: 1,),
                Expanded(child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 100),
                      child: Row(
                        children: [
                          Text('${data.bokname}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: Divider(thickness:1,color: Colors.black,),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5,right:80),
                      child: Row(
                        children: [
                          Text('AUTHOR NAME:${data.authorname}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 85),
                      child: Row(
                        children: [
                          Text('FLOOR NUMBER:${data.floornumber}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 85,),
                      child: Row(
                        children: [
                          Text('SHELF NUMBER:${data.shelfnumber}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  
                    IconButton(onPressed: (){},
                     icon: Icon(Icons.delete,color: Color.fromARGB(255, 174, 16, 5),)),
                    
                  ],
                )
                )
                  ],
                )
                ),
             ),
           );
            });
            },
          ),
   
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx1)=>AddDetails()));
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
       ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
            
            children: [
           IconButton(onPressed: (){},
            icon: Column(
              children: [
                Icon(Icons.home,color: Colors.white,),
                Text('home',style: TextStyle(fontSize: 10,color: Colors.white),),
              ],
            )),
            
            IconButton(onPressed: (){},
             icon: Padding(
               padding: const EdgeInsets.only(right: 16),
               child: Column(
                 children: [
                   Icon(Icons.category,color: Colors.white,),
                   Text('category',style: TextStyle(fontSize: 10,color: Colors.white),)
                 ],
               )
               
               ),
               
               ),
              SizedBox(width: 10),
             IconButton(onPressed: (){},
              icon: Column(
                children: [
                  Icon(Icons.favorite,color: Colors.white,),
                  Text('favourite',style: TextStyle(fontSize: 10,color: Colors.white),)
                ],
              )),
              IconButton(onPressed: (){},
               icon: Column(
                 children: [
                   Icon(Icons.person,color: Colors.white,),
                   Text('person',style: TextStyle(fontSize: 10,color: Colors.white),)
                 ],
               )),
            ]
          ),
        ),
        
      ),
  
    );
  }
}


