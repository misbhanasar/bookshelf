import 'package:flutter/material.dart';
import 'package:library_project/screens/home.dart';

class splash2 extends StatelessWidget {
  const splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
         Container(child:
         
          Center(child: Image(image: AssetImage('assets/images/Screenshot 2024-03-02 224236.png'),height: 300,width: 200,))
          ),
          Text('welcome to '),
          Text('BOOKSHELF',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
        
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Homescreen()));
          },
           child: Text('Lets Go',style: TextStyle(color: Colors.black),))
          ]
          ),
      
    );
  }
}