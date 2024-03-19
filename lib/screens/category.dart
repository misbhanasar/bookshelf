import 'package:flutter/material.dart';
import 'package:library_project/style/colors.dart';

class categorypage extends StatefulWidget {


  
  const categorypage ({super.key});

  @override
  State<categorypage> createState() => _categorypageState();
}

class _categorypageState extends State<categorypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            
            height: double.infinity,
            width: double.infinity,
            
            decoration: BoxDecoration(
              color: color.blue,
              ),
              child: SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('BOOKDETAILS',style: TextStyle(color: color.white,fontWeight: FontWeight.bold),),
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
              height: 680,
              width: 700,
              decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(34),
              ),
              ),
           ),
           SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 150),
               child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                                Container(
                                     height: 170,
                                     width: 170,
                                   decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 10),
                                     color: const Color.fromARGB(255, 229, 153, 178),
                                     borderRadius: BorderRadiusDirectional.circular(24),
                                     boxShadow: [BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
             
                                     )]
                                   ),
                                   
             
                                   ),
                                   Container(
                                     height: 170,
                                     width: 170,
                                   decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 10),
                                     color: const Color.fromARGB(255, 229, 153, 178),
                                     borderRadius: BorderRadiusDirectional.circular(24),
                                     boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10
                                      )
                                     ]
                                   ),
                                   child: Column(
                                    children: [
                                     
                                    ],
                                   ),
                                   ),
                                 ],
                                ),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 70),
                                   child: Column(
                                     children: [
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Container(
                                               height: 170,
                                               width: 170,
                                             decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white,width: 10),
                                               color: Color.fromARGB(255, 6, 172, 237),
                                               borderRadius: BorderRadiusDirectional.circular(24),
                                               boxShadow: [BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.black,
                                           
                                               )]
                                             ),
                                             
                                           
                                             ),
                                              Container(
                                     height: 170,
                                     width: 170,
                                   decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 10),
                                     color: const Color.fromARGB(255, 229, 153, 178),
                                     borderRadius: BorderRadiusDirectional.circular(24),
                                     boxShadow: [BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black,
             
                                     )]
                                   ),
                                   
             
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
                                     Container(
                                        height: 170,
                                        width: 170,
                                      decoration: BoxDecoration(
                                       border: Border.all(color: Colors.white,width: 10),
                                        color: const Color.fromARGB(255, 229, 153, 178),
                                        borderRadius: BorderRadiusDirectional.circular(24),
                                        boxShadow: [BoxShadow(
                                         blurRadius: 10,
                                         color: Colors.black,
                                     
                                        )]
                                      ),
                                      
                                     
                                      ),
                                       Container(
                                     height: 170,
                                     width: 170,
                                   decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 10),
                                     color: const Color.fromARGB(255, 229, 153, 178),
                                     borderRadius: BorderRadiusDirectional.circular(24),
                                     boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10
                                      )
                                     ]
                                   ),
                                   child: Column(
                                    children: [
                                     
                                    ],
                                   ),
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