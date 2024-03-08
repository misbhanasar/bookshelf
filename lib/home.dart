import 'package:flutter/material.dart';
import 'package:library_project/adddetails.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key?key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15,left: 15,bottom: 10),
            decoration: BoxDecoration(
            color: Colors.blue,
           
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
            ),
            child: Column(
              children: [
             
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 3),
                  child: Text(
                    'BOOKSHELF',
                    style: 
                    TextStyle(fontSize: 20,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white,
                    )
                    
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  width: 360,
                  // width: MediaQuery.of(context).size.width,
                  height: 40,
                
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search here.....',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search,size: 25,color: Colors.grey,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home,color: Colors.white,),
                ],
              ),
            )
              
             
            ]
          ),
        ),
        
      ),
    //   bottomNavigationBar:BottomNavigationBar(
    // showUnselectedLabels: true,
    //     iconSize: 20,
    //     selectedItemColor: Colors.blue,
    //     selectedFontSize: 10,
    //     unselectedItemColor: Colors.grey,
        
    //     items: [
        
    //     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
    //     BottomNavigationBarItem(icon: Icon(Icons.category),label: 'category'),
    //      BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorite'),
    //       BottomNavigationBarItem(icon: Icon(Icons.person),label: 'user'),
    //   ]) ,
    );
  }
}


