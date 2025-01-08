// lib/components/text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String fieldName;
  final String regexPattern;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? additionalValidation;

  const CustomTextField({
    super.key, 
    required this.fieldName, 
    required this.regexPattern,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.additionalValidation,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText && !_showPassword,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Enter ${widget.fieldName}",
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 234, 233, 233),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.white54,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white54,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${widget.fieldName} cannot be empty';
        } 
        
        if (!RegExp(widget.regexPattern).hasMatch(value)) {
          switch (widget.fieldName) {
            case 'email':
              return 'Please enter a valid email address';
            case 'password':
              return 'Password must be at least 8 characters with one number and one special character';
            case 'full name':
              return 'Please enter a valid name';
            case 'username':
              return 'Username can only contain letters, numbers, and underscores';
            default:
              return 'Please enter valid ${widget.fieldName}';
          }
        }

        // Run additional validation if provided
        if (widget.additionalValidation != null) {
          return widget.additionalValidation!(value);
        }

        return null;
      },
    );
  }
}

// Example regex patterns for different fields
class ValidationPatterns {
  static const String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String password = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
  static const String name = r'^[a-zA-Z\s]{2,}$';
  static const String username = r'^[a-zA-Z0-9_]{3,20}$';
  static const String phone = r'^\+?[\d\s-]{10,}$';
}