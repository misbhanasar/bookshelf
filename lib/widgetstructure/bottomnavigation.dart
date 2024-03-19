import 'package:flutter/material.dart';
import 'package:library_project/screens/addbook.dart';



class screenBottomNavigation extends StatelessWidget {
  const screenBottomNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx1)=>AddDetails()));
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
       ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
            
            children: [
           IconButton(onPressed: (){},
            icon: Column(
              children: [
                Icon(Icons.home,color: Colors.white,),
                Text('home',style: TextStyle(fontSize: 10,color: Colors.white),),
              ],
            )),
            
            IconButton(onPressed: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>categorypage(bookmodel, data)));
            },
             icon: Padding(
               padding: const EdgeInsets.only(right: 16),
               child: Column(
                 children: [
                   Icon(Icons.category,color: Colors.white,),
                   Text('category',style: TextStyle(fontSize: 10,color: Colors.white),)
                 ],
               )
               
               ),
               
               ),
              SizedBox(width: 10),
             IconButton(onPressed: (){},
              icon: Column(
                children: [
                  Icon(Icons.favorite,color: Colors.white,),
                  Text('favourite',style: TextStyle(fontSize: 10,color: Colors.white),)
                ],
              )),
              IconButton(onPressed: (){},
               icon: Column(
                 children: [
                   Icon(Icons.person,color: Colors.white,),
                   Text('person',style: TextStyle(fontSize: 10,color: Colors.white),)
                 ],
               )),
            ]
          ),
        ),
        
      ),// Placeholder for the body, replace with your actual content
    );
  }
}