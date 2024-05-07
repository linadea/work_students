import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderWidth;

  const GradientBorderContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              startGradientColor.withOpacity(0.44),
              endGradientColor.withOpacity(0.45),
            ],
            stops: const [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(36.0 + borderWidth - 3),
          boxShadow: const [
            BoxShadow(
              color: shadowColor,
              offset: Offset(0, 2),
              blurRadius: 16.0,
            )
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(borderWidth.toDouble()),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(33.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
