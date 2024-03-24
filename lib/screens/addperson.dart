import 'package:flutter/material.dart';
import 'package:library_project/style/colors.dart';

class Addcustomer extends StatelessWidget {
  const Addcustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        elevation: 0.0,
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        title: const Text('AddPerson details',
        style: 
        TextStyle(
          color: color.white,
          fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 67, 165, 226),Color.fromARGB(255, 22, 55, 76)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
                )
            ),
          ),
      ),
    );
  }
}