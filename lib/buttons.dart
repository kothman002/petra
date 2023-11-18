import 'package:flutter/material.dart';

class MyCustomContainer extends StatelessWidget {
  const MyCustomContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap
  });
  final String text;
  final IconData icon;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(5, 18, 20, 16),
      child: TextButton(
        onPressed: (){},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(58, 27, 15, 1)),
        ),
        child: Row(
          children:  [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
           const  SizedBox(width: 100),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

