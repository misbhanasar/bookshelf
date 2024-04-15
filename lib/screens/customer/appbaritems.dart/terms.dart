import 'package:flutter/material.dart';

class TermsandCondition extends StatelessWidget {
  const TermsandCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Terms and Condition')),
        backgroundColor: const Color.fromARGB(255, 208, 215, 219),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Terms and Condition',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '.The bookshelf app is intended solely for use by authorized library guides employed by the library to assist customers in locating books within the library premises.'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '.The app provides comprehensive information about each book available in the library, including but not limited to its title, author, category, floor number, and shelf number.'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '.The app offers insights into the layout of the library, detailing the number of floors and shelves on each floor for efficient navigation.'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '.Upon borrowing a book, library guides are required to record customer information such as name, address, phone number, along with details of the borrowed book including its name, collection date, and due date for return.'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '.Users have the option to mark certain books as favorites or track recently borrowed books within the app for enhanced user experience.'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '. By accessing and using the bookshelf app, library guides acknowledge and agree to abide by these terms and conditions in their entirety.'),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      '. Customers must adhere to the librarys borrowing policies and return borrowed books within the stipulated timeframe as per the due date. '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
