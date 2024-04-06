import 'package:flutter/material.dart';
import 'package:library_project/screens/main_page.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
            child: Image(
          image: AssetImage('assets/images/Screenshot 2024-03-02 224236.png'),
          height: 300,
          width: 200,
        )),
        const Text('welcome to '),
        const Text('BOOKSHELF',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) => const MainPage()),
                  (route) => false);
            },
            child: const Text(
              'Lets Go',
              style: TextStyle(color: Colors.black),
            ))
      ]),
    );
  }
}
