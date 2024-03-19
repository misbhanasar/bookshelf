import 'package:flutter/material.dart';
import 'package:library_project/style/colors.dart';

void customsnackbar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
      margin: const EdgeInsets.all(10),
      content: Text(message,
      style: TextStyle(color: color.white),
      ),
    
    ));
}