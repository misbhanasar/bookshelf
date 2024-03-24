import 'package:flutter/material.dart';
import 'package:library_project/pages/comics.dart';
import 'package:library_project/pages/fitction.dart';
import 'package:library_project/pages/horror.dart';
import 'package:library_project/pages/novels.dart';
import 'package:library_project/pages/romance.dart';
import 'package:library_project/pages/tech.dart';
import 'package:library_project/style/colors.dart';

class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: color.blue,
            ),
            child: const SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'BOOKDETAILS',
                            style: TextStyle(
                                color: color.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 590,
              width: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(34),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 150),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                color: const Color.fromARGB(255, 16, 16, 16),
                                borderRadius:
                                    BorderRadiusDirectional.circular(24),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                  )
                                ]),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const Horror()));
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/Screenshot 2024-03-20 214134.png'))),
                          ),
                          const Text('HORROR'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                color: const Color.fromARGB(255, 229, 153, 178),
                                borderRadius:
                                    BorderRadiusDirectional.circular(24),
                                boxShadow: const [BoxShadow(blurRadius: 10)]),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const Romance()));
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'assets/images/Screenshot 2024-03-20 213959.png'))),
                          ),
                          const Text('ROMANCE'),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 1.0, vertical: 70),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 170,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 10),
                                      color: const Color.fromARGB(255, 248, 249, 250),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(24),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black,
                                        )
                                      ]),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) => const Fitction()));
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/images/Screenshot 2024-03-20 214022.png'))),
                                ),
                                const Text('FITCTION'),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 170,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 10),
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(24),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black,
                                        )
                                      ]),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) => const Comics()));
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/images/Screenshot 2024-03-20 213933.png'))),
                                ),
                                const Text('COMICS')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 170,
                                width: 170,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 10),
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(24),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                      )
                                    ]),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => const Tech()));
                                  },
                                  child: const Image(
                                      image: AssetImage(
                                          'assets/images/Screenshot 2024-03-20 221305.png')),
                                ),
                              ),
                              const Text('TECH'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 170,
                                width: 170,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 10),
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(24),
                                    boxShadow: const [BoxShadow(blurRadius: 10)]),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => const Novels()));
                                    },
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/images/Screenshot 2024-03-20 221224.png'))),
                              ),
                              const Text('NOVELS'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
