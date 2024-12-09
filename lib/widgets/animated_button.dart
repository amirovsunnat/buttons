import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        padding: EdgeInsets.all(_isPressed ? 12 : 16),
        decoration: BoxDecoration(
          color:
              _isPressed ? const Color.fromARGB(255, 0, 56, 103) : Colors.blue,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isPressed
              ? []
              : [BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: Text(
          _isPressed ? 'Button bosilmoqda' : 'Animatsiyali Tugma',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
