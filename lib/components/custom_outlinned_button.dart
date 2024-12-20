import 'package:flutter/material.dart';

class CustomOutlinnedButton extends StatelessWidget {
  const CustomOutlinnedButton({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('assets/${categoryName.toLowerCase()}.png'),
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 2,),
          Text(
            categoryName ,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
