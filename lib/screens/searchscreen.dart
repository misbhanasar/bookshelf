
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:library_project/functions/db_book.dart';
// import 'package:library_project/model/data_model.dart';
// import 'package:library_project/screens/searchview.dart';
// import 'package:library_project/style/colors.dart';
// // 
// class Searchscreen extends StatefulWidget {
  
//   const Searchscreen({super.key});

//   @override
//   State<Searchscreen> createState() => _SearchscreenState();
// }

// class _SearchscreenState extends State<Searchscreen> {
// //  late TextEditingController searchcontroller;
// //   int selectedindex=0;
// //   List<bookmodel>searchbookresult=[];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // searchcontroller=TextEditingController();
//     getallbooks();
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(200),
        
//         child: AppBar(
//           flexibleSpace: Container(
//             padding: EdgeInsets.only(top: 15, left: 20, bottom: 10),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30, left: 3),
//                   child: Center(
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 100),
//                           child: Text(
//                             'searchbar',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
                    
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20, bottom: 20),
//                   width: 360,
//                   height: 40,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: TextFormField(
                   
//                     // onChanged: (query)=>performSearch(query),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'search here.....',
//                        icon: IconButton(onPressed: (){
//                         showSearch(context: context,
//                          delegate: StudentSearchDelegate(recipes))
//                        },
//                         icon: Icon(Icons.search)),
                       
//                       hintStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                      filled: true,
//                      fillColor: color.white,
                     
                      
//                     ),
//                   ),
//                 ),
            
               
//               ],
//             ),
//           ),
//           elevation: 5, // Remove elevation for a flat look
//           backgroundColor: Colors.transparent, // Set background color to transparent
//         ),
        
//       ),
      
//       body:  Container(
//                   child: ListView(
                    
//                     children: [
//                       for(var books in searchbookresult )
//                       ListTile(
//                         selectedColor: color.blue,
//                         leading: CircleAvatar(
                          
//                           backgroundImage: FileImage(File(books.imagepath)),
//                           radius: 30,
//                         ),
//                         title: Text('${books.bokname},'),textColor: const Color.fromARGB(255, 0, 0, 0),
//                         subtitle: Text('${books.authorname}'),
//                         trailing: SizedBox(
//                           width: 28,
//                           height: 65,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(onPressed: (){
                                
//                               },
//                                icon: Icon(Icons.arrow_forward_ios,color: const Color.fromARGB(255, 3, 3, 3),)),
//                             ],
//                           ),
//                         ),
//                         onTap: (){
//                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Searchview(data: books)));
//                         },
//                       ),
                      
//                     ],
                  
//                   ),
//                 ),
//     );
//   }
// }
// class StudentSearchDelegate extends SearchDelegate<List<bookmodel>> {
//   final List<bookmodel> recipes;

//   StudentSearchDelegate(this.recipes);
// }
// //       body: ListView.separated(itemBuilder: (context,index){
// //         final data=searchbookresult[index];
// //         return ListTile(
// //           leading: CircleAvatar(
// //             backgroundImage:  FileImage(File(data.imagepath)),
// //           ),
// //         title: Text('${data.bokname},'),textColor: const Color.fromARGB(255, 0, 0, 0),
// //          subtitle: Text('${data.authorname}'),
// //          onTap: (){},
// //         );
// //       },
// //        separatorBuilder: (context,index){
// //         return Divider();
// //        },
// //         itemCount: searchbookresult.length),
      
// //     );
// //   }
// // }













