import 'package:flutter/material.dart';
import 'package:library_project/style/colors.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color.blue,
       appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 150,
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        title: const Text(
          'Settings',
          style: TextStyle(color: color.white, fontWeight: FontWeight.bold),
        ),
       
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: color.white
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  ),
              gradient: LinearGradient(colors: [
               Color.fromARGB(255, 5, 146, 234),
                Color.fromARGB(255, 159, 165, 169),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      // body: 
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     color: const Color.fromARGB(255, 2, 26, 69),
      //     child: ListTile(
      //       leading: CircleAvatar(
      //         backgroundImage: AssetImage('assets/images/Screenshot 2024-03-02 224514.png'),
      //       ),
      //       title: Text('Account settings',style: TextStyle(color: color.white,fontWeight: FontWeight.bold),),
      //       subtitle: Text('privacy,security,launguage',style: TextStyle(color: color.white),),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Title(color: Colors.black, child: Text('GENERAL',style: TextStyle(fontSize: 10),)
                 
                 ),
               ],
             ),
           ),
           Card(
             child: ListTile(
              
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Screenshot 2024-03-20 214134.png'),
                
              ),
              title:Text('ABOUT APP',style: TextStyle(color: const Color.fromARGB(255, 2, 0, 0)),),
              subtitle: Text('detail vishion of app',style: TextStyle(color: Colors.grey),),
             ),
           ),
          //  Divider(thickness: 5,color: Color.fromARGB(255, 202, 200, 200),),
          ],
          
        ),
        
      ),
      
      
    );
  }
}
