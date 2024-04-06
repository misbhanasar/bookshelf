

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_project/functions/db_user.dart';
import 'package:library_project/model/user_model.dart';
import 'package:library_project/screens/customer/persondetails.dart';
import 'package:library_project/style/colors.dart';
import 'package:library_project/widgetstructure/calender.dart';
import 'package:library_project/widgetstructure/snackbar.dart';
import 'package:library_project/widgetstructure/textformfield.dart';

class EditPerson extends StatefulWidget {
  final Usermodel? usermodel;
  
  const EditPerson({super.key, required this.usermodel});

  @override
  State<EditPerson> createState() => _AddcustomerState();
}

class _AddcustomerState extends State<EditPerson> {
  final formkey=GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final phnonemunbercontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final collecteddatecontroller = TextEditingController();
  final duedatecontroller = TextEditingController();
  final bookdetailstakencontroller = TextEditingController();

  DateTime? collectedbookdate;
  DateTime? duedatebook;

  @override
  void initState() {
    
    super.initState();
  
    
  }

  @override
  Widget build(BuildContext context) {
   namecontroller.text=widget.usermodel!.name;
   phnonemunbercontroller.text=widget.usermodel!.phnonenumber;
   addresscontroller.text=widget.usermodel!.address;
   bookdetailstakencontroller.text=widget.usermodel!.bookname;
   collecteddatecontroller.text=widget.usermodel!.collecteddate;
   duedatecontroller.text=widget.usermodel!.duedate; 
    int? id = widget.usermodel?.id;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        title: const Text(
          'AddPerson details',
          style: TextStyle(color: color.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
               Color.fromARGB(255, 5, 146, 234),
                Color.fromARGB(255, 159, 165, 169),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: customTextfeild(
                  controller: namecontroller,
                  keyboardTYpe: TextInputType.text,
                  labelText: 'enter the customer name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter your name';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customTextfeild(
                      controller: phnonemunbercontroller,
                      keyboardTYpe: TextInputType.number,
                      labelText: 'enter phnonenumber',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone Number is Required';
                        } else if (!RegExp(r"^(?:\+91)?[0-9]{10}$")
                            .hasMatch(value)) {
                          return 'Enter Valid Mobile number';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customTextfeild(
                      controller: addresscontroller,
                      keyboardTYpe: TextInputType.text,
                      labelText: 'enter the address',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter address';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: customTextfeild(
                          controller: bookdetailstakencontroller,
                          keyboardTYpe: TextInputType.text,
                          labelText: 'enter book name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter book name';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: customtextFeildcalender(
                                controller: collecteddatecontroller,
                                onTapcalender: () {
                                  collectedbook(context);
                                },
                                labeltext: 'collected date',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'CheckIn is Required';
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customtextFeildcalender(
                              controller: duedatecontroller,
                              onTapcalender: () {
                                duedatebooks(context);
                              },
                              labeltext: 'duedate',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'CheckOut is Required';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction),
                        )),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 163, 201, 233),
                              side: const BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 143, 139, 139))),
                          onPressed: () {
                            edituser(context,id);
                          },
                          child: const Text(
                            'save details',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> collectedbook(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        collectedbookdate = pickedDate;
        collecteddatecontroller.text =
            DateFormat('yyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> duedatebooks(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        duedatebook = pickedDate;
        duedatecontroller.text = DateFormat('yyy-MM-dd').format(pickedDate);
      });
    } else {
      setState(() {
        duedatebook = null;
        duedatecontroller.text = 'indefinite';
      });
    }
  }

  Future<void> edituser( BuildContext context,int? id) async {
  
    final name = namecontroller.text.trim();
    final phnonenumber = phnonemunbercontroller.text.trim();
    final address = addresscontroller.text.trim();
    final bookname = bookdetailstakencontroller.text.trim();
    final collecteddate = collecteddatecontroller.text.trim();
    final duedate = duedatecontroller.text.trim();
    if (name.isEmpty ||
        phnonenumber.isEmpty ||
        address.isEmpty ||
        bookname.isEmpty ||
        collecteddate.isEmpty ||
        duedate.isEmpty) {
        return;
    }

    final data = Usermodel(
       name: name,
       phnonenumber: phnonenumber,
       address: address,
       bookname: bookname,
       collecteddate:collecteddate,
       duedate: duedate,
       id: widget.usermodel!.id

        );
        

        await updateuser(data,widget.usermodel!.id!);
        customsnackbar(context, 'edited  details is sucessfully ');
        Future.delayed(Duration(seconds: 1),(){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>PersonDetails(data: data)));
        });
         // ignore: use_build_context_synchronously
         Navigator.of(context).pop();
         Navigator.of(context).pop();
        
    
  }
}
