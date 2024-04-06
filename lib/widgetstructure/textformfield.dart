import'package:flutter/material.dart';

Widget customTextfeild({
  required TextEditingController controller,
  required TextInputType keyboardTYpe,
  required String labelText,
  required String? Function(String?)? validator,
  required AutovalidateMode autovalidateMode,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField(
          
          controller: controller,
          keyboardType: keyboardTYpe,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Color.fromARGB(255, 7, 152, 242)),
            filled: true,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(122, 88, 88, 88)
              )
            ),
            focusedBorder: const OutlineInputBorder(),
            fillColor: const Color.fromARGB(255, 163, 201, 233),
            labelText: labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          validator: validator,
          autovalidateMode: autovalidateMode,
        ),
      ),
    ],
  );
}