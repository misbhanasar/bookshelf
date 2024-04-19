import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_project/functions/db_user.dart';
import 'package:library_project/model/user_model.dart';
import 'package:library_project/screens/customer/persondetails.dart';
import 'package:library_project/style/colors.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({
    super.key,
  });

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 90,
          backgroundColor: const Color.fromARGB(255, 254, 254, 254),
          title: const Text(
            'Person list',
            style: TextStyle(color: color.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 5, 146, 234),
                  Color.fromARGB(255, 159, 165, 169),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'all person details',
              ),
              Tab(
                text: 'due details',
              )
            ],
            labelColor: Color.fromARGB(255, 255, 255, 255),
            unselectedLabelColor: Color.fromARGB(255, 97, 89, 89),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder<List<Usermodel>>(
              valueListenable: usernotifier,
              builder: (BuildContext context, List<Usermodel> userList,
                  Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = userList[index];
                    return Card(
                      elevation: 15,
                      color: const Color.fromARGB(255, 236, 236, 236),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PersonDetails(
                                    data: data,
                                  )));
                        },
                        title: Row(
                          children: [Text('Name:     ${data.name}')],
                        ),
                        subtitle: Row(
                          children: [
                            Text('Phn no:      ${data.phnonenumber}'),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Alert'),
                                        content: const Text(
                                            'are you sure to delete'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                if (data.id != null) {
                                                  deleteuser(data.id!);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content: Text(
                                                        'person details is deleted sucessfulyy'),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ));
                                                } else {}
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('yes')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('no'))
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 168, 4, 20),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: userList.length,
                );
              },
            ),
          ),
          Center(
            child: ValueListenableBuilder<List<Usermodel>>(
              valueListenable: usernotifier,
              builder: (BuildContext context, List<Usermodel> userList,
                  Widget? child) {
                final List<Usermodel> userwithduebooks = userList.where((user) {
                  // ignore: unused_local_variable
                  DateTime collecteddate =
                      DateFormat('yyy-MM-dd').parse(user.collecteddate);
                  DateTime duedate =
                      DateFormat('yyy-MM-dd').parse(user.duedate);
                  return DateTime.now().isAfter(duedate);
                }).toList();

                if (userwithduebooks.isEmpty) {
                  return const Text('no due books');
                }

                return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = userwithduebooks[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PersonDetails(
                            data: data,
                          ),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          elevation: 15,
                          color: const Color.fromARGB(255, 249, 3, 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PersonDetails(
                                        data: data,
                                      )));
                            },
                            title: Row(
                              children: [Text('Name:     ${data.name}')],
                            ),
                            subtitle: Row(
                              children: [
                                Text('Phn no:      ${data.phnonenumber}'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Alert'),
                                            content: const Text(
                                                'are you sure to delete'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    if (data.id != null) {
                                                      deleteuser(data.id!);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            'person details is deleted sucessfulyy'),
                                                        duration:
                                                            Duration(seconds: 2),
                                                      ));
                                                    } else {}
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('yes')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('no'))
                                            ],
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Color.fromARGB(255, 214, 202, 203),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: userwithduebooks.length,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
