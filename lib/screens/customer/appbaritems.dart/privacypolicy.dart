import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Privacy Policy')),
        backgroundColor: const Color.fromARGB(255, 208, 215, 219),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Column(
            
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'personal Information',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('We may collect personal information such as your name, address, and contact details when you use the app to borrow books.',),
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Usage Data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('We may collect non-personal information about how you interact with the app, such as device information and usage patterns.'
                  )
                                 
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Information Sharing',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('We do not share your personal information with third parties except as required for app functionality or as necessary to comply with legal obligations.'
                  ),
                                 
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Data Security',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('We take reasonable measures to protect your information from unauthorized access, alteration, or disclosure.'
                  ),
                 ),
                 
              ],
            )
    ),
        ),
      ),
    );
  }
}
