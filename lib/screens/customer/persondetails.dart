import 'package:flutter/material.dart';
import 'package:library_project/functions/db_user.dart';
import 'package:library_project/model/user_model.dart';
import 'package:library_project/screens/customer/editperson.dart';
import 'package:library_project/style/colors.dart';

class PersonDetails extends StatefulWidget {
  final Usermodel data;
  const PersonDetails({super.key, required this.data});

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        title: const Text(
          'Person details',
          style: TextStyle(color: color.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>EditPerson(usermodel: widget.data)));
          },
           icon: const Icon(Icons.edit,color: color.white,)
           ),
        ],
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         Card(
           child: Container(
            height: 500,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 234, 229, 229),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('NAME:',style: TextStyle(fontWeight:FontWeight.bold),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('PHONE NUMBER:',style: TextStyle(fontWeight:FontWeight.bold),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ADDRESS:',style: TextStyle(fontWeight:FontWeight.bold),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('BOOKNAME:',style: TextStyle(fontWeight:FontWeight.bold),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('COLLECTED DATE:',style: TextStyle(fontWeight:FontWeight.bold),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('DUE DATE:',style: TextStyle(fontWeight:FontWeight.bold)),
                ),
              ],
            ),
           ),
           
         ),
          Card(
           child: Container(
            height: 500,
            width: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:const Color.fromARGB(255, 236, 233, 233),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.data.name),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.data.phnonenumber),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.data.address),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.data.bookname),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.data.collecteddate),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.data.duedate),
                ),
              ],
            ),
           ),
           
         ),
        
          ],
        ),
      ),
    );
  }
}