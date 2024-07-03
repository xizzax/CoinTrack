import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const RoundIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onPressed,
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF1B1B1B),
                    blurRadius: 0.6,
                    spreadRadius: 1,
                    offset: Offset(1.5, 1.5),
                  )
                ]),
            child: Icon(
              icon,
              color: iconColor,
            )),
      ),
    );
  }
}
