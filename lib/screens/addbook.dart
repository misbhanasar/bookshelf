import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/functions/db_floorshelf.dart';
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
// late String? image;

// File? pickedimage;
// String? pickedimagepath='';
String imagepath='';
int selectedFloor = 0;
int shelfNumber = 0;
int selectedShelf = 0;





final floor=[
  '1',
  '2',
  '3',
];


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
                      return ' author name is required';
                    }
                    return null;
                  }
                  ),


                  SizedBox(height: 15,),


                  // TextFormField(
                  //   controller: floornumbercontroller,
                  // decoration: InputDecoration(
                  //   hintStyle: TextStyle(color: Colors.blue),
                  //   filled: true,
                  //   enabledBorder: UnderlineInputBorder(
                  //      borderSide: BorderSide(
                  //       color: Colors.black12
                  //     )
                  //   ),
                  //   focusedBorder: OutlineInputBorder(
                  //   ),
                  //   fillColor: Color.fromARGB(255, 163, 201, 233),
                  //   label: Text('floor number',style: TextStyle(color: const Color.fromARGB(255, 97, 92, 92))),
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //   )
                  // ),
                  //  validator: (value){
                  //   if(value==null || value.isEmpty){
                  //     return ' floor number is required';
                  //   }
                  //   return null;
                  // }
                  // ),
                 DropdownButton(
                  hint: selectedFloor==0?Text('floor number',style: TextStyle(color: const Color.fromARGB(255, 100, 96, 96))):Text('$selectedFloor',style: TextStyle(color: const Color.fromARGB(255, 100, 96, 96))),
                  // decoration: InputDecoration(
                  //    filled: true,
                  //   fillColor:  Color.fromARGB(255, 163, 201, 233),
                  // ),
                  items: floorsettinglistnotifier.value.map((e){
                    return DropdownMenuItem(value: e, child: Text(e.floornumbersetting));
                  }).toList(),
                  onChanged:(value){
                    setState(() {
                      selectedFloor = int.parse(value!.floornumbersetting);
                      shelfNumber = int.parse(value.shelfnumbersetting);
                      selectedShelf=0;
                    });
                  print(value);
                 }),
  


                 const SizedBox(height: 15),


                  // TextFormField(
                  //   controller: shelfnumbercontroller,
                  // decoration: InputDecoration(
                  //   hintStyle:const TextStyle(color: Colors.blue),
                  //   filled: true,
                  //   enabledBorder: const UnderlineInputBorder(
                  //      borderSide: BorderSide(
                  //       color: Colors.black12
                  //     )
                  //   ),
                  //   focusedBorder: const OutlineInputBorder(
                  //   ),
                  //   fillColor:  Color.fromARGB(255, 163, 201, 233),
                  //   label:  Text('shelf number',style: TextStyle(color: const Color.fromARGB(255, 113, 109, 109))),
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //   )
                  // ),
                  //  validator: (value){
                  //   if(value==null || value.isEmpty){
                  //     return ' shelf number is required';
                  //   }
                  //   return null;
                  // }
                  // ),
                  DropdownButton(
                   
                  hint: selectedShelf==0?Text('shelf number',style: TextStyle(color: const Color.fromARGB(255, 100, 96, 96))):Text('${selectedShelf}',style: TextStyle(color: const Color.fromARGB(255, 100, 96, 96))),
                  // decoration: InputDecoration(
                  //    filled: true,
                  //   fillColor:  Color.fromARGB(255, 163, 201, 233),
                  // ),
                  items: List.generate(shelfNumber, (index){
                    return DropdownMenuItem(value: '${index+1}',child: Text('${index+1}'),);
                  }),
                  onChanged:(value){
                    setState(() {
                      selectedShelf = int.parse(value!);
                    });
                  print(value);
                 }),
  
              


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
                      return ' book details is requied';
                    }
                    return null;
                  }
                  ),
                 const  SizedBox(height: 30,),


                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 163, 201, 233),
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
  final pickedFile=
  await ImagePicker().pickImage(source: ImageSource.gallery);

  if(pickedFile!=null){
setState(() {
  // pickedimage=File(PickedFile .path);
  // pickedimagepath=PickedFile.path;
  imagepath=pickedFile.path;
});
  }

 }

 Future<void>addbookdetails(BuildContext context)async{
if(_formkey.currentState!.validate()){
  final bokname=booknamecontroller.text.trim();
  final authorname=authornamecontroller.text.trim();
  final bookdetails=bookdetailscontroller.text.trim();
  if(bokname.isEmpty||
     authorname.isEmpty||
     selectedFloor==0||
     selectedShelf==0||
     bookdetails.isEmpty||
     imagepath.isEmpty){
      log(bookdetails);
      log('entered here');
      return;

     }
      final book= bookmodel( 
        bokname: bokname, 
        authorname: authorname,
         floornumber: selectedFloor.toString(), 
         shelfnumber: selectedShelf.toString(), 
         bookdetails: bookdetails,
         imagepath: imagepath,
         );


         await addbook(book);
         Navigator.of(context).pop();

}

 
}
String?validatordropedown(String?value){
  if (value==null||value.isEmpty) {
    return 'please select thr value';
  }
  return null;
}
}