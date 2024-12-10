

import 'package:expense_2/components/custom_nav_bar.dart';
import 'package:expense_2/components/group_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff27313b),
      body: Padding(
        padding: const EdgeInsets.only(left : 10.0, right: 10, bottom: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
              //color: Colors.red,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Welcome Back\n", style:GoogleFonts.ubuntu(fontWeight: FontWeight.w700, color: Colors.blueGrey.shade300, fontSize: 15)),
                         TextSpan(text: "Hi Mohammed Junaid", style: GoogleFonts.ubuntu( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
                      ],
                    )
                  ),
                  const CircleAvatar(radius: 27, backgroundImage:AssetImage("assets/avatar.png"),)
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pending Bills" ,style:GoogleFonts.ubuntu(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)),
                        Text("View all", style:GoogleFonts.ubuntu(fontWeight: FontWeight.w700, color: Colors.blueGrey.shade300, fontSize: 15))
                      ],
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 420,
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        
                        itemBuilder: (BuildContext context, index){
                          return const Padding(
                                  padding: EdgeInsets.only(right: 16.0), // Add space after each card
                                  child:  GroupCard(),
                                );
                        }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar()
    );
  }
}

