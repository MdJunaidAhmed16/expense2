import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  
  const CustomTextField({super.key, required this.fieldName, required this.regexPattern});
  final String fieldName;
  final String regexPattern;

  @override
  Widget build(BuildContext context) {
    String fieldVal = "";
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter $fieldName",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 234, 233, 233)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 20,
          borderSide: BorderSide(
            color: Colors.white, // Define your border color
            width: 2, // Define the border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white, // Same color as enabledBorder
            width: 1.5, // Same width as enabledBorder
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$fieldName cannot be empty';
        } else if (!RegExp(regexPattern).hasMatch(value)) {
          return 'Enter a valid $fieldName';
        }
        return null;
      },
      onSaved: (value) {
        fieldVal = value!;
      },
    );
  }
}
