import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupCard extends StatefulWidget {
  const GroupCard({super.key});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 253, 200, 94),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width * 0.68,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sam's Bday Party", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)),
                Text("\$300.9", style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16) )
              ],
            ),
            const SizedBox(height: 20,),
            Text("Split with", style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14), textAlign: TextAlign.end,),
            const SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width,
              child:const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children : [
                   CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar.png"),),
                    CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar2.png"),),
                    CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar5.png"),),
                    CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar3.png"),),
                    CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar4.png"),),
                    CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar2.png"),),
                    CircleAvatar(radius: 30, backgroundImage:AssetImage("assets/avatar3.png"),),
                ],
                ),
              ),
            )
            ,
            const SizedBox(height: 20,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: ()=>{}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    fixedSize: const Size(120, 45),
                  ),
                child: Text("Review later", style : GoogleFonts.ubuntu(fontWeight: FontWeight.normal, color: Colors.black45, fontSize: 12))),
                ElevatedButton(
                  onPressed: ()=>{}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    fixedSize: const Size(120, 45),
                  ),
                child: Text("Split Now", style : GoogleFonts.ubuntu(fontWeight: FontWeight.bold, color: Colors.black45, fontSize: 12)))
              ], 
            )
          ],
        ),
      ),
    );
  }
}