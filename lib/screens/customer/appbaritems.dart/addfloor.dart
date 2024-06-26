import 'package:flutter/material.dart';
import 'package:library_project/functions/db_floorshelf.dart';
import 'package:library_project/model/floor_model.dart';
import 'package:library_project/screens/home.dart';


class AddFloor extends StatefulWidget {
  const AddFloor({super.key});

  @override
  State<AddFloor> createState() => _SettingsState();
}

class _SettingsState extends State<AddFloor> {
final enterfloornumber=TextEditingController();
final entertotalshelf=TextEditingController();
final GlobalKey<FormState>_formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('AddFloor & Shelf',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                        keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.blue),
                        filled: true,
                        enabledBorder: const UnderlineInputBorder(
                           borderSide: BorderSide(
                            color: Colors.black12
                          )
                        ),
                        focusedBorder: const OutlineInputBorder(
                        ),
                        fillColor: const Color.fromARGB(255, 163, 201, 233),
                        label: const Text('enter the floor number here',style: TextStyle(color: Color.fromARGB(255, 109, 105, 105))),
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
            const SizedBox(height: 20,),
        
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                       controller: entertotalshelf,
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.blue),
                        filled: true,
                        enabledBorder: const UnderlineInputBorder(
                           borderSide: BorderSide(
                            color: Colors.black12
                          )
                        ),
                        focusedBorder: const OutlineInputBorder(
                        ),
                        fillColor: const Color.fromARGB(255, 163, 201, 233),
                        label: const Text('enter the total  shelf number',style: TextStyle(color: Color.fromARGB(255, 109, 105, 105))),
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
            const SizedBox(height: 20,),
        
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 130),
              child: ElevatedButton(onPressed: (){
                
                addsettingdetails(context);
               
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 163, 201, 233),
                side:const BorderSide(width: 1,color: Color.fromARGB(255, 143, 139, 139))
              ),
               child: const Text('add details',style: TextStyle(color: Color.fromARGB(255, 128, 115, 115)),)),
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
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Homescreen()));
    }
    
  }
  
}