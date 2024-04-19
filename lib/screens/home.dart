import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/functions/db_fav.dart';

import 'package:library_project/functions/db_user.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/customer/addperson.dart';
import 'package:library_project/screens/bookdetails.dart';
import 'package:library_project/screens/customer/appbaritems.dart/aboutus.dart';
import 'package:library_project/screens/customer/appbaritems.dart/privacypolicy.dart';
import 'package:library_project/screens/customer/appbaritems.dart/searchscreen.dart';
import 'package:library_project/screens/customer/appbaritems.dart/addfloor.dart';
import 'package:library_project/screens/customer/appbaritems.dart/terms.dart';
import 'package:library_project/style/colors.dart';
import 'package:library_project/widgetstructure/snackbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late TextEditingController searchcontroller;
  late Box<Bookmodel> favouritebox;
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
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const Row(
                  children: [
                    Icon(Icons.settings, size: 30),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('SETTINGS'),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Title(
                      color: Colors.black,
                      child: const Text(
                        'GENERAL',
                        style: TextStyle(fontSize: 10),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => const AboutUs()));
                  },
                  child: const Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/Screenshot 2024-03-20 214134.png'),
                      ),
                      title: Text(
                        'ABOUT US',
                        style: TextStyle(color: Color.fromARGB(255, 2, 0, 0)),
                      ),
                      subtitle: Text(
                        'detail vishion of app',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        children: [
                          Title(
                            color: Colors.black,
                            child: const Text('Terms and Conition'),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) =>
                                        const TermsandCondition()));
                              },
                              icon: const Padding(
                                padding: EdgeInsets.only(left: 90),
                                child: Icon(Icons.navigate_next),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        children: [
                          Title(
                            color: Colors.black,
                            child: const Text('Privacy Policy'),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const PrivacyPolicy()));
                              },
                              icon: const Padding(
                                padding: EdgeInsets.only(left: 130),
                                child: Icon(Icons.navigate_next),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                builder: (ctx) => const AddFloor()));
                          },
                          icon: const Padding(
                            padding: EdgeInsets.only(
                              left: 70,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  'add floor',
                                  style: TextStyle(
                                      fontSize: 10, color: color.white),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  width: 360,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
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
                          elevation: 15,
                          color: const Color.fromARGB(255, 236, 236, 236),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
                                              image: FileImage(
                                                  File(data.imagepath)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 30,
                                            ),
                                            child: IconButton(
                                                onPressed: () async {
                                                  await addFavourite(
                                                      data.id.toString());
                                                  setState(() {});
                                                  customsnackbar(context,
                                                      'book adeed to favourite');
                                                },
                                                icon: data.favorite == false
                                                    ? const Icon(
                                                        Icons.favorite_border,
                                                        color: Color.fromARGB(
                                                            255, 188, 6, 24),
                                                        size: 20,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color: Color.fromARGB(
                                                            255, 188, 6, 24),
                                                        size: 20,
                                                      )),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title:
                                                          const Text('Alert'),
                                                      content: const Text(
                                                          'are you sure to delete'),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              if (data.id !=
                                                                  null) {
                                                                deletebookdetails(
                                                                    data.id!);
                                                                ScaffoldMessenger.of(
                                                                        context)
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
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                'yes')),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                'no'))
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
                                          Builder(
                                            builder: (BuildContext context) {
                                              return IconButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        Addcustomer(
                                                            selectedBookName:
                                                                data.bokname),
                                                  ));
                                                },
                                                icon: Padding(
                                                  padding: const EdgeInsets.only(top: 30,),
                                                  child: const Icon(
                                                    Icons.book,
                                                    size: 20,
                                                  ),
                                                ),
                                                
                                                // const Text(
                                                //   'booknow',
                                                //   style: TextStyle(
                                                //     fontSize: 10,
                                                //   ),
                                                // ),
                                              );
                                             
                                            },
                                          ),
                                         
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(top: 30),
                                          //   child: bui(
                                          //     child: TextButton.icon(
                                          //         onPressed: () {
                                          //           Navigator.of(context).push(
                                          //               MaterialPageRoute(
                                          //                   builder: (ctx) =>
                                          //                       const Addcustomer(selectedBookName: data.bokname)));
                                          //         },
                                          //         icon: const Icon(
                                          //           Icons.book,
                                          //           size: 10,
                                          //         ),
                                          //         label: const Text(
                                          //           'booknow',
                                          //           style: TextStyle(
                                          //             fontSize: 10,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
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
