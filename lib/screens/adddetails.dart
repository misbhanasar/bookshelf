import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_project/functions/db_functions.dart';
import 'package:library_project/model/data_model.dart';
import 'package:library_project/screens/home.dart';





class AddDetails extends StatefulWidget {
  final bookmodel? bokmodel;

  const AddDetails({super.key, this.bokmodel});

  

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
final booknamecontroller=TextEditingController();

final TextEditingController   authornamecontroller=TextEditingController();

final floornumbercontroller=TextEditingController();

final shelfnumbercontroller=TextEditingController();

final bookdetailscontroller=TextEditingController();

final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
late String? image;


final ImagePicker _imagePicker=ImagePicker();
File? pickedimage;
String? pickedimagepath='';
String imagepath='';

@override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: Text('Add book details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        
       child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 163, 201, 233),
                        border: Border.all(color: Color.fromARGB(255, 96, 92, 92)),
                        borderRadius: BorderRadius.circular(20),
                        image: imagepath !=null
                         ? DecorationImage(image: FileImage(File(imagepath)),
                        fit: BoxFit.cover,
                        )
                        :const DecorationImage(image: AssetImage(' assets/images/Screenshot 2024-03-02 224236.png'),
                        fit: BoxFit.cover,
                        ),
                      ),
                    child: IconButton(onPressed: (){
                      pickimagefromgallery();
                    },
                     icon: Icon(Icons.add_a_photo)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: booknamecontroller,
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
                    label: Text('bookname',style: TextStyle(color: Color.fromARGB(255, 109, 105, 105))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                 
                    ),
                   
                  ),
                  
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return ' empty';
                    }
                    return null;
                  }
                  ),
                
              
              
                SizedBox(height: 15,),
              
              
                TextFormField(
                    controller: authornamecontroller,
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
                    label: Text('author name',style: TextStyle(color: const Color.fromARGB(255, 100, 96, 96))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
        
                    )
                  ),
                   validator: (value){
                    if(value==null || value.isEmpty){
                      return ' empty';
                    }
                    return null;
                  }
                  ),


                  SizedBox(height: 15,),


                  TextFormField(
                    controller: floornumbercontroller,
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
                    label: Text('floor number',style: TextStyle(color: const Color.fromARGB(255, 97, 92, 92))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                   validator: (value){
                    if(value==null || value.isEmpty){
                      return ' empty';
                    }
                    return null;
                  }
                  ),


                 const SizedBox(height: 15),


                  TextFormField(
                    controller: shelfnumbercontroller,
                  decoration: InputDecoration(
                    hintStyle:const TextStyle(color: Colors.blue),
                    filled: true,
                    enabledBorder: const UnderlineInputBorder(
                       borderSide: BorderSide(
                        color: Colors.black12
                      )
                    ),
                    focusedBorder: const OutlineInputBorder(
                    ),
                    fillColor:  Color.fromARGB(255, 163, 201, 233),
                    label:  Text('shelf number',style: TextStyle(color: const Color.fromARGB(255, 113, 109, 109))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                   validator: (value){
                    if(value==null || value.isEmpty){
                      return ' empty';
                    }
                    return null;
                  }
                  ),
              


                   const SizedBox(height: 15),
              
              
                  TextFormField(
                    controller: bookdetailscontroller,
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
                    fillColor: Color.fromARGB(255, 163, 201, 233),
                    label: Text('bookdetails',style: TextStyle(color: const Color.fromARGB(255, 109, 104, 104))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                   validator: (value){
                    if(value==null || value.isEmpty){
                      return ' empty';
                    }
                    return null;
                  }
                  ),
                 const  SizedBox(height: 30,),


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 163, 201, 233),
                      side:const BorderSide(width: 1,color: Color.fromARGB(255, 143, 139, 139))
                    ),
                    onPressed: (){
                    addbookdetails(context);
                     
                    },
                   child: Text('addbookdetails',style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),),))
              
                ],
              ),
            ),
          ),
        ),
      );
  
    
  }

 Future pickimagefromgallery()async{
  final XFile?PickedFile=
  await _imagePicker.pickImage(source: ImageSource.gallery);

  if(PickedFile!=null){
setState(() {
  pickedimage=File(PickedFile .path);
  pickedimagepath=PickedFile.path;
  imagepath=pickedimagepath!;
});
  }

 }

 Future<void>addbookdetails(BuildContext context)async{
if(_formkey.currentState!.validate()){
  final bokname=booknamecontroller.text.trim();
  final authorname=authornamecontroller.text.trim();
  final floornumber=floornumbercontroller.text.trim();
  final shelfnumber=shelfnumbercontroller.text.trim();
  final bookdetails=bookdetailscontroller.text.trim();
  final Image=imagepath;
  if(bokname.isEmpty||
     authorname.isEmpty||
     floornumber.isEmpty||
     shelfnumber.isEmpty||
     bookdetails.isEmpty||
     imagepath.isEmpty){
      return;

     }
      final book= bookmodel( 
        bokname: bokname, 
        authorname: authorname,
         floornumber: floornumber, 
         shelfnumber: shelfnumber, 
         bookdetails: bookdetails);


         addbook(book);
         Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (context)=>Homescreen())
         );

}

 
}
}