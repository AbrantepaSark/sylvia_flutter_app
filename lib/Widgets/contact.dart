import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final IconData icon;
  final String title, text;
  const Contact({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.green,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            Text(text),
          ],
        )
      ],
    );
  }
}
