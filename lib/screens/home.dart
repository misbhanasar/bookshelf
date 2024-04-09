import 'dart:io';
import 'package:flutter/material.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/functions/db_user.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/customer/addperson.dart';
import 'package:library_project/screens/bookdetails.dart';
import 'package:library_project/screens/searchscreen.dart';
import 'package:library_project/screens/settings.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late TextEditingController searchcontroller;
  int selectedindex = 0;
  List<Bookmodel> searchbookresult = [];
  List previoussearchiteams = [];

  @override
  void initState() {
    super.initState();
    searchcontroller = TextEditingController();
    getallbooks();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> category = [''];

    getallbooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          flexibleSpace: Container(
            padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10),
            decoration: const BoxDecoration(
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
                        const Padding(
                          padding: EdgeInsets.only(left: 100),
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
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Settings()));
                            },
                            icon: const Padding(
                              padding: EdgeInsets.only(
                                left: 82,
                              ),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 20,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(),
                        child: IconButton(
                            onPressed: () {
                              //  showSearch(context: context,
                              //   delegate: StudentSearchDelegate(booklistnotifier.value));
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Searchscreen()));
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 25,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0, // Remove elevation for a flat look
          backgroundColor:
              Colors.transparent, // Set background color to transparent
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
                    height: 220,
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
                                        top: 5, right: 80),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 85),
                                    child: Row(
                                      children: [
                                        Text(
                                          'FLOOR NUMBER:          ${data.floornumber}',
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      right: 85,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'SHELF NUMBER:           ${data.shelfnumber}',
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
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
                                         padding: const EdgeInsets.only(top: 30,),
                                         child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.favorite_border,
                                          color: Color.fromARGB(255, 188, 6, 24),
                                          size: 20,)),
                                       ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text('Alert'),
                                                  content: const Text(
                                                      'are you sure to delete'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          if (data.id != null) {
                                                            deletebookdetails(
                                                                data.id!);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                              content: Text(
                                                                  'book  is deleted sucessfulyy'),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                            ));
                                                          } else {
                                                            print(
                                                                'book details is null.unable to delete');
                                                          }
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('yes')),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text('no'))
                                                  ],
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 174, 16, 5),
                                              size: 15,
                                            )),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: TextButton.icon(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          const Addcustomer()));
                                            },
                                            icon: const Icon(
                                              Icons.book,
                                              size: 10,
                                            ),
                                            label: const Text(
                                              'booknow',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            )),
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

Future<void> showsnackbarmessage(BuildContext context) async {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('bookdetails is deleted'),
  ));
}



//search bar

// class StudentSearchDelegate extends SearchDelegate<List<bookmodel>> {
//   final List<bookmodel> recipes;

//   StudentSearchDelegate(this.recipes);

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, []);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return _buildSearchResults(context, query);
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return _buildSearchResults(context, query);
//   }

//   Widget _buildSearchResults(BuildContext context, String query) {
//     final List<bookmodel> searchResults = booklistnotifier.value
//         .where(
//             (book) => book.bokname.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     if (query.isEmpty) {
//       return Container();
//     }

//     return ListView.separated(
//       itemBuilder: (context, index) {
//         final data = searchResults[index];
//         return ListTile(
          
//           leading: CircleAvatar(
//             backgroundImage: FileImage(File(data.imagepath)),
//           ),
//           title: Text(data.bokname),
//           subtitle: Text(data.authorname),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Searchview(data: data),
//               ),
//             );
//           },
         
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const Divider();
//       },
//       itemCount: searchResults.length,
//     );
//   }
// }
