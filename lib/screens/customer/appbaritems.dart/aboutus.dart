import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 193, 200, 204),
        title: const Center(child: Text('ABOUT US')),
      ),
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Center(child: Text('BOOKSHELF APP',style: TextStyle(fontWeight:FontWeight.bold),)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Welcome to our Bookshelf App! Were dedicated to helping you navigate our large library with ease. Our app is designed to assist library guides in locating books for customers quickly and efficiently. With detailed information about each book, including its location, category, and availability, our app streamlines the process of finding the perfect read. We prioritize user experience and strive to make your library visits enjoyable and stress-free. Thank you for choosing our app to enhance your library experience!'
                        ,style: TextStyle(fontSize: 16,fontStyle:FontStyle.italic),
                        ),
                 
                  ),
                ),
               
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}