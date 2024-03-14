import 'package:flutter/material.dart';
import 'package:library_project/functions/db_floorshelf.dart';
import 'package:library_project/model/floor_model.dart';
import 'package:library_project/screens/home.dart';


class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
final enterfloornumber=TextEditingController();
final entertotalshelf=TextEditingController();
final GlobalKey<FormState>_formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('settings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body:Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
              child: TextFormField(
                        controller: enterfloornumber,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.blue),
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                            color: Colors.black12
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                        ),
                        fillColor: Color.fromARGB(255, 163, 201, 233),
                        label: Text('enter the floor number here',style: TextStyle(color: Color.fromARGB(255, 109, 105, 105))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value){
                    if(value==null || value.isEmpty){
                      return ' floornumber is empty';
                    }
                    return null;
                  }
                      ),
            ),
            SizedBox(height: 20,),
        
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                       controller: entertotalshelf,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.blue),
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(
                            color: Colors.black12
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                        ),
                        fillColor: Color.fromARGB(255, 163, 201, 233),
                        label: Text('enter the total  shelf number',style: TextStyle(color: Color.fromARGB(255, 109, 105, 105))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value){
                    if(value==null || value.isEmpty){
                      return ' shelf number is empty';
                    }
                    return null;
                  }
                      ),
            ),
            SizedBox(height: 20,),
        
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 130),
              child: ElevatedButton(onPressed: (){
                
                addsettingdetails(context);
               
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 163, 201, 233),
                side:const BorderSide(width: 1,color: Color.fromARGB(255, 143, 139, 139))
              ),
               child: Text('add details',style: TextStyle(color: const Color.fromARGB(255, 128, 115, 115)),)),
            )
          ],
        ),
      )
    
                
    );
    
  }
  Future<void>addsettingdetails( context)async{
    if(_formkey.currentState!.validate()){
      final floornumbersetting=enterfloornumber.text.trim();
      final shelfnumbersetting=entertotalshelf.text.trim();
      if(floornumbersetting.isEmpty||
         shelfnumbersetting.isEmpty){
          return;
         }


         final floor=FloorModel(
          floornumbersetting: floornumbersetting,
           shelfnumbersetting: shelfnumbersetting);

           await addsettingdetailsToDb(floor);
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Homescreen()));
    }
    
  }
  
}