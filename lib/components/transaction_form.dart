import 'package:expense_2/components/custom_outlinned_button.dart';
import 'package:expense_2/components/text_field.dart';
import 'package:flutter/material.dart';

class TxnForm extends StatefulWidget {
  const TxnForm({super.key});

  @override
  State<TxnForm> createState() => _TxnFormState();
}

class _TxnFormState extends State<TxnForm> {
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27313b),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextField(fieldName: "UPI ID", regexPattern: r'^[a-zA-z0-9]+@ok[a-zA-z]+$',),
              const SizedBox(height: 20,),
              const CustomTextField(fieldName: "Amount", regexPattern: r'^[0-9]+$',),
              const SizedBox(height: 20,),
              const Text("Category", style: TextStyle(color: Colors.white, fontSize: 15),),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  CustomOutlinnedButton(categoryName: "Grocerry"),
                  SizedBox(width: 10,),
                  CustomOutlinnedButton(categoryName: "Movie"),
                  SizedBox(width: 10,),
                  CustomOutlinnedButton(categoryName: "Electricity"),
                ],
              ),
              const SizedBox(height: 20,),
              const CustomTextField(fieldName: "Description", regexPattern: r'^[a-zA-z0-9]+$',),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: const Text("Pay ", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
