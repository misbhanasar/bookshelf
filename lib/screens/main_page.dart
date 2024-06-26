import 'package:flutter/material.dart';
import 'package:library_project/screens/addbook.dart';
import 'package:library_project/screens/category.dart';
import 'package:library_project/screens/favourite.dart';
import 'package:library_project/screens/home.dart';
import 'package:library_project/screens/customer/preson.dart';

ValueNotifier<int> screenNotifier = ValueNotifier(0);

List<dynamic> screens = [
  const Homescreen(),
  const Categorypage(),
  const FavouritePage(),
  const PersonPage()
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: screenNotifier,
          builder: (BuildContext ctx, int index, Widget? _) {
            return screens[index];
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx1) => const AddDetails()));
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          color: Colors.blue,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {
                  screenNotifier.value = 0;
                  screenNotifier.notifyListeners();
                },
                icon: const Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Text(
                      'home',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                )),
            IconButton(
              onPressed: () {
                screenNotifier.value = 1;
                screenNotifier.notifyListeners();
              },
              icon: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      Text(
                        'category',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  )),
            ),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () {
                  screenNotifier.value = 2;
                  screenNotifier.notifyListeners();
                },
                icon: const Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    Text(
                      'favourite',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                )),
            IconButton(
                onPressed: () {
                  screenNotifier.value = 3;
                  screenNotifier.notifyListeners();
                },
                icon: const Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text(
                      'person',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
