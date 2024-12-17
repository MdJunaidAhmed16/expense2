import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(radius: 30, backgroundColor: Color.fromARGB(255, 85, 94, 105), child: Icon(FontAwesome.circle_up_solid, size: 30, color: Colors.white,),),
                            SizedBox(height: 5,),
                            Text("Debit", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(radius: 30, backgroundColor: Color.fromARGB(255, 85, 94, 105), child: Icon(FontAwesome.circle_down_solid, size: 30, color: Colors.white,),),
                            SizedBox(height: 5,),
                            Text("Credit", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(radius: 30, backgroundColor: Color.fromARGB(255, 85, 94, 105), child: Center(child: Icon(HeroIcons.user_group, size: 30, color: Colors.white,)),),
                            SizedBox(height: 5,),
                            Text("Groups", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(radius: 30, backgroundColor: Color.fromARGB(255, 85, 94, 105), child: Center(child: Icon(FontAwesome.money_bill_transfer_solid, size: 25, color: Colors.white,)),),
                            SizedBox(height: 5,),
                            Text("History", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(radius: 30, backgroundColor: Color.fromARGB(255, 85, 94, 105), child: Center(child: Icon(FontAwesome.ellipsis_solid, size: 25, color: Colors.white,)),),
                            SizedBox(height: 5,),
                            Text("More", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),)
                          ],
                        )
                      ],
                    ),
                  );
  }
}