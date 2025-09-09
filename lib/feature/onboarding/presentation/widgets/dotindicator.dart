import 'package:flutter/material.dart';

class Dotindicator extends StatelessWidget {
  final bool isActive;
  const Dotindicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12.0 : 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}