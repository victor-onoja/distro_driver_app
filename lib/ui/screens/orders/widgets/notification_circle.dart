import 'package:flutter/material.dart';

class NotificationCircle extends StatelessWidget {
  final Color color;
  final String text;
  final bool schedule;

  const NotificationCircle(
      {super.key,
      required this.color,
      required this.text,
      required this.schedule});

  @override
  Widget build(BuildContext context) {
    return schedule
        ? Positioned(
            top: 0,
            right: 16,
            child: Container(
              width: 20, // Adjust the size of the circle as needed
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Center(child: Text(text)),
            ),
          )
        : Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 20, // Adjust the size of the circle as needed
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Center(child: Text(text)),
            ),
          );
  }
}
