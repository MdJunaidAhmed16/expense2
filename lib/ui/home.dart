import 'package:expense_2/components/custom_nav_bar.dart';
import 'package:expense_2/components/group_card.dart';
import 'package:expense_2/components/menu_items.dart';
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
          padding: const EdgeInsets.only(left: 20.0, right: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: "Welcome Back\n",
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueGrey.shade300,
                                  fontSize: 15)),
                          TextSpan(
                              text: "Hi Mohammed Junaid",
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18)),
                        ],
                      )),
                      const CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage("assets/avatar.png"),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pending Bills",
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16)),
                    Text("View all",
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey.shade300,
                            fontSize: 15))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 420,
                  height: 220,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(
                              right: 16.0), // Add space after each card
                          child: GroupCard(),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const MenuItems(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("OnGoing",
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15)),
                    Text("View all",
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey.shade300,
                            fontSize: 15))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // !TODO displaying recent two unpaid or unreceived group bills would be nice
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.2, // Set a specific height
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.117,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 225, 138, 144),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(radius: 16, backgroundImage:AssetImage("assets/avatar.png"),),
                                                SizedBox(width: 10,),
                                                Text('Movie Tickets', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Text('Total Bill', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                                            Text("\$20.00", style: TextStyle(color: Colors.white, fontSize: 16.1, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        ElevatedButton(onPressed: ()=>{},style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          fixedSize: Size(MediaQuery.sizeOf(context).width * 0.2, MediaQuery.of(context).size.height * 0.09,),
                                          backgroundColor: const Color.fromARGB(231, 255, 255, 255),
                                        ), 
                                        child: const Text("Send", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomBar());
  }
}
