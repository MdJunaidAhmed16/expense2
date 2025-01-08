import 'package:expense_2/components/text_field.dart';
import 'package:expense_2/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (mounted) {
        // Navigate to home screen after successful login
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleOAuthLogin(String provider) async {
    try {
      await _authService.oauthLogin(provider);
      // Handle OAuth redirect
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27313b),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form( // Add Form widget
            key: _formKey,
            child: Column(
              children: [
                const Image(image: AssetImage('assets/login.png')),
                const SizedBox(height: 20),
                CustomTextField(
                  fieldName: "your email",
                  regexPattern: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  controller: _emailController,
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  fieldName: "your password",
                  regexPattern: r'^.{8,}$',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                _isLoading
                  ? const CircularProgressIndicator(
                      color: Color.fromARGB(255, 253, 200, 94),
                    )
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 253, 200, 94),
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                const SizedBox(height: 20),
                const Text(
                  "Or, login with ...",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 20),
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
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, "/register"),
                      child: const Text(
                        "Register",
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
      ),
    );
  }

  Widget _buildOAuthButton(String provider, String assetPath) {
    return OutlinedButton(
      onPressed: () => _handleOAuthLogin(provider),
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(12),
        fixedSize: const Size(100, 55),
      ),
      child: Image(image: AssetImage(assetPath), width: 60, height: 60),
    );
  }
}