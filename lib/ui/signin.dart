import 'package:expense_2/components/text_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  const Color(0xff27313b),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/login.png')),
            const SizedBox(height: 20,),
            const CustomTextField(fieldName: "your email or user name", regexPattern: 'r^[a-zA-z]+/@[com]'),
            const SizedBox(height: 20,),
            const CustomTextField(fieldName: "your password", regexPattern: 'r^[a-zA-z]+/@[com]'),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 253, 200, 94),
              fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
            ),
            child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20), )
            ),
            const SizedBox(height: 25,),
            const Text("Or, login with ...", style: TextStyle(color: Colors.white, fontSize: 14),),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: ()=>{}, 
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.all(12),
                  fixedSize: const Size(100, 55),
                ),
                child: const Image(image: AssetImage('assets/google.png'), width: 60, height: 60,),
              ),
              OutlinedButton(onPressed: ()=>{}, 
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.all(12),
                  fixedSize: const Size(100, 55),
                ),
                child: const Image(image: AssetImage('assets/facebook.png'), width: 60, height: 60,),
              ),
              OutlinedButton(onPressed: ()=>{}, 
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.all(12),
                  fixedSize: const Size(100, 55),
                ),
                child: const Image(image: AssetImage('assets/X.png'), width: 60, height: 60,),
              ),
              ],
            ),
            const SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(color: Colors.white, fontSize: 15),),
                TextButton(onPressed: (){}, child: const Text("Register", style: TextStyle(color: Color.fromARGB(255, 253, 200, 94), fontSize: 15, fontWeight: FontWeight.w600),))
              ],
            )
          ],
        ),
      ),
    );
  }
}