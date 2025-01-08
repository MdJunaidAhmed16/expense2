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
  final _upiIdController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27313b),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                fieldName: "UPI ID",
                regexPattern: r'^[a-zA-z0-9]+@ok[a-zA-z]+$', controller: _upiIdController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                fieldName: "Amount",
                regexPattern: r'^[0-9]+$', controller: _amountController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Category",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  CustomOutlinnedButton(categoryName: "Grocerry"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomOutlinnedButton(categoryName: "Movie"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomOutlinnedButton(categoryName: "Electricity"),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(135, 10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Add more ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                fieldName: "Description",
                regexPattern: r'^[a-zA-z0-9]+$', controller: _amountController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        elevation: 10,
                        backgroundColor: const Color(0xff27313b),
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            
                          );
                        }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      iconColor: Colors.black,
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.payments,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Pay ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 252, 184, 96),
                      iconColor: Colors.black,
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.contacts_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Split with ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
