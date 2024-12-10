import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  // Update selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
       // notchMargin: 8.0, // Space around the button
        color: const Color(0xff27313b),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home_outlined, color: _selectedIndex == 0 ? const Color.fromARGB(255, 253, 200, 94) : Colors.white),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(HeroIcons.user_group, color: _selectedIndex == 1 ? const Color.fromARGB(255, 253, 200, 94) : Colors.white),
              onPressed: () => _onItemTapped(1),
            ),
            Center(
              child: Transform.rotate(
                angle: 90 * 3.141592653589793 / 180,
                child: ClipPath(
                  clipper: HexagonClipper(),
                  child: GestureDetector(
                    onTap: ()=>{},
                    child: Container(
                      width: 55,
                      height: 95,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.amber, Colors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            offset: const Offset(-4, -4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.white, size: 30,),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(HeroIcons.rectangle_group, color: _selectedIndex == 2 ? const Color.fromARGB(255, 253, 200, 94) : Colors.white),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(HeroIcons.bell_alert, color: _selectedIndex == 3 ? const Color.fromARGB(255, 253, 200, 94) : Colors.white),
              onPressed: () => _onItemTapped(3),
            ),
        ],
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;

    return Path()
      ..moveTo(width / 2, 0) // Top middle
      ..lineTo(width, height * 0.25) // Top right
      ..lineTo(width, height * 0.75) // Bottom right
      ..lineTo(width / 2, height) // Bottom middle
      ..lineTo(0, height * 0.75) // Bottom left
      ..lineTo(0, height * 0.25) // Top left
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}