// lib/screens/signup.dart
import 'package:expense_2/components/text_field.dart';
import 'package:expense_2/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  bool _isLoading = false;

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController(); // Add phone controller
  String _gender = 'male';

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.register(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text
      );

      // Navigate to home screen or show success message
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _oauthLogin(String provider) async {
    try {
      await _authService.oauthLogin(provider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27313b),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _nameController,
                fieldName: "your full name",
                regexPattern: r'^[a-zA-Z\s]+$',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _phoneController,
                fieldName: "your phone number",
                regexPattern: r'^[a-zA-Z0-9_]+$',
                keyboardType: TextInputType.numberWithOptions(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                fieldName: "your email",
                regexPattern: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                fieldName: "your password",
                obscureText: true,
                regexPattern: r'^.{8,}$',
              ),
              const SizedBox(height: 20),
              // Gender Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildGenderButton(
                      'male', Icons.male_outlined, Colors.blueAccent),
                  _buildGenderButton(
                      'female', Icons.female_outlined, Colors.pinkAccent),
                ],
              ),
              const SizedBox(height: 30),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 253, 200, 94),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
              const SizedBox(height: 25),
              const Text(
                "Or, signup with ...",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 25),
              // OAuth Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOAuthButton('google', 'assets/google.png'),
                  _buildOAuthButton('facebook', 'assets/facebook.png'),
                  _buildOAuthButton('twitter', 'assets/X.png'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 253, 200, 94),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String gender, IconData icon, Color iconColor) {
    return OutlinedButton(
      onPressed: () => setState(() => _gender = gender),
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        side: BorderSide(
          color: _gender == gender ? Colors.amber : Colors.grey,
          width: _gender == gender ? 2 : 1,
        ),
        padding: const EdgeInsets.all(12),
        fixedSize: const Size(91, 56),
      ),
      child: Row(
        children: [
          Text(
            gender.capitalize(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          Icon(icon, color: iconColor, size: 23),
        ],
      ),
    );
  }

  Widget _buildOAuthButton(String provider, String assetPath) {
    return OutlinedButton(
      onPressed: () => _oauthLogin(provider),
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(12),
        fixedSize: const Size(80, 50),
      ),
      child: Image(image: AssetImage(assetPath), width: 40, height: 40),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
