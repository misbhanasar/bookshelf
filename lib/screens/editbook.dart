import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_project/functions/db_book.dart';
import 'package:library_project/functions/db_floorshelf.dart';
import 'package:library_project/model/data_model.dart';

class Editbookdetails extends StatefulWidget {
  final Bookmodel? bokmodel;

  const Editbookdetails({super.key,required this.bokmodel});

  @override
  State<Editbookdetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<Editbookdetails> {
  final booknamecontroller = TextEditingController();

  final TextEditingController authornamecontroller = TextEditingController();

  final shelfnumbercontroller = TextEditingController();

  final bookdetailscontroller = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String  selectedCategory='';
  String imagepath = '';
  int selectedFloor = 0;
  int shelfNumber = 0;
  int selectedShelf = 0;


  @override
  Widget build(BuildContext context) {
    selectedFloor=int.parse(widget.bokmodel!.floornumber);
    selectedShelf=int.parse(widget.bokmodel!.shelfnumber);
    selectedCategory=widget.bokmodel!.category;
    imagepath = widget.bokmodel!.imagepath;
    booknamecontroller.text=widget.bokmodel!.bokname;
    authornamecontroller.text=widget.bokmodel!.authorname;
    shelfnumbercontroller.text=widget.bokmodel!.shelfnumber;
    bookdetailscontroller.text=widget.bokmodel!.bookdetails;
    log(widget.bokmodel!.category);
   
    
    
    int? id = widget.bokmodel?.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add book details'),
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
                      color: const Color.fromARGB(255, 163, 201, 233),
                      border: Border.all(
                          color: const Color.fromARGB(255, 96, 92, 92)),
                      borderRadius: BorderRadius.circular(20),
                      // ignore: unnecessary_null_comparison
                      image: imagepath != null
                          ? DecorationImage(
                              image: FileImage(File(imagepath)),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: AssetImage(
                                  ' assets/images/Screenshot 2024-03-02 224236.png'),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          pickimagefromgallery();
                        },
                        icon: const Icon(Icons.add_a_photo)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: booknamecontroller,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.blue),
                      filled: true,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      focusedBorder: const OutlineInputBorder(),
                      fillColor: const Color.fromARGB(255, 163, 201, 233),
                      label: const Text('bookname',
                          style: TextStyle(
                              color: Color.fromARGB(255, 109, 105, 105))),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' empty';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: authornamecontroller,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.blue),
                        filled: true,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: const OutlineInputBorder(),
                        fillColor: const Color.fromARGB(255, 163, 201, 233),
                        label: const Text('author name',
                            style: TextStyle(
                                color: Color.fromARGB(255, 100, 96, 96))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' author name is required';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: const Color.fromARGB(255, 163, 201, 233),
                  child: DropdownButton(

                    isExpanded: true,
                    hint: selectedFloor == 0
                        ? const Text('floor number',
                            style: TextStyle(
                                color: Color.fromARGB(255, 100, 96, 96)))
                        : Text('$selectedFloor',
                            style: const TextStyle(
                                color: Color(0xFF646060))),
                    items: floorsettinglistnotifier.value.map((e) {
                      return DropdownMenuItem(
                        
                          value: e, child: Text(e.floornumbersetting));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFloor = int.parse(value!.floornumbersetting);
                        shelfNumber = int.parse(value.shelfnumbersetting);
                        selectedShelf = 0;
                      });
                    },
                    
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  color: const Color.fromARGB(255, 163, 201, 233),
                  child: DropdownButton(
                   
                    isExpanded: true,
                    hint: selectedShelf == 0
                        ? const Text('shelf number',
                            style: TextStyle(
                                color: Color.fromARGB(255, 100, 96, 96)))
                        : Text('$selectedShelf',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 100, 96, 96))),
                    items: List.generate(shelfNumber, (index) {
                      return DropdownMenuItem(
                        value: '${index + 1}',
                        child: Text('${index + 1}'),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedShelf = int.parse(value!);
                      });
                      print(value);
                    },
                    // validator: (value){
                    //   if(value==0||value==null){
                    //       return 'Please select a shelf number';
                    //   }
                    //   return null;
                    // },
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    controller: bookdetailscontroller,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.blue),
                        filled: true,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: const OutlineInputBorder(),
                        fillColor: const Color.fromARGB(255, 163, 201, 233),
                        label: const Text('bookdetails',
                            style: TextStyle(
                                color: Color.fromARGB(255, 109, 104, 104))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' book details is requied';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: const Color.fromARGB(255, 163, 201, 233),
                  child: DropdownButtonFormField(
                    hint: Text(selectedCategory),

                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(
                          
                            value: '1',
                          
                            child: Text('select the category')),
                        DropdownMenuItem(value: 'horror', child: Text('horror')),
                        DropdownMenuItem(value: 'fiticton', child: Text('fitction')),
                        DropdownMenuItem(value: 'romance', child: Text('romance')),
                        DropdownMenuItem(value: 'comics', child: Text('comics')),
                         DropdownMenuItem(value:'tech', child:Text('tech ')),
                          DropdownMenuItem(value:'novels', child:Text('novels')),
                      ],
                      onChanged: (v) {
                        selectedCategory=v!;
                      },
                      validator: (value) {
                        if(value==null|| value.isEmpty||value=='1'){
                          return 'please select  the category';
                        }
                        return null;
                      },
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 163, 201, 233),
                        side: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 143, 139, 139))),
                    onPressed: () async {
                      await editbook(context, id);
                    },
                    child: const Text(
                      'addbookdetails',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickimagefromgallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // pickedimage=File(PickedFile .path);
        // pickedimagepath=PickedFile.path;
        imagepath = pickedFile.path;
      });
    }
  }

  Future<void> editbook(BuildContext context, int? id) async {
   if(booknamecontroller.text.isEmpty||
   authornamecontroller.text.isEmpty||
   selectedFloor==0||
   selectedShelf==0||
   bookdetailscontroller.text.isEmpty||
   selectedCategory.isEmpty){
    return;
   }

   final data = Bookmodel(bokname: booknamecontroller.text, 
   authorname: authornamecontroller.text, 
   floornumber: selectedFloor.toString(),
    shelfnumber: selectedShelf.toString(),
     bookdetails: bookdetailscontroller.text,
      imagepath: imagepath,
       category: selectedCategory,
       id: widget.bokmodel!.id!);
 
  

    log(widget.bokmodel!.id.toString());
    try{
      await updatebooks(data, widget.bokmodel!.id!);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }catch(e){
      log('error');
      log(e.toString());
    }
  }
  

  String? validatordropedown(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select thr value';
    }
    return null;
  }

}




