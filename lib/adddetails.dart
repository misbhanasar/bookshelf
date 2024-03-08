import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDetails extends StatefulWidget {
   AddDetails({super.key});

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
late String image;


final ImagePicker _imagePicker=ImagePicker();
File? pickedimage;
String pickedimagepath='';
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
                        image: imagepath .isNotEmpty
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


                  SizedBox(height: 15),


                  TextFormField(
                    controller: shelfnumbercontroller,
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
                    label: Text('shelf number',style: TextStyle(color: const Color.fromARGB(255, 113, 109, 109))),
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
              


                  SizedBox(height: 15),
              
              
                  TextFormField(
                    controller: bookdetailscontroller,
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
                  SizedBox(height: 30,),


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 163, 201, 233),
                      side: BorderSide(width: 1,color: Color.fromARGB(255, 143, 139, 139))
                    ),
                    onPressed: (){
                      if(_formkey.currentState!.validate()){
                        addbookdetails(context);
                      }
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

  if(pickedimage!=null){
setState(() {
  pickedimage=File(PickedFile.path);
  pickedimagepath=PickedFile.path;
  imagepath=pickedimagepath;
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
  
}
 }
 
}