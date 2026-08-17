import 'package:flutter/material.dart';

class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  NeonButton({required this.label, required this.onTap});

  @override
  _NeonButtonState createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFF00f0ff), width: 2),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Color(0xFF00f0ff).withOpacity(0.8),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Color(0xFF00f0ff).withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            widget.label,
            style: TextStyle(
              color: Color(0xFFd08af6),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Color(0xFFd08af6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
