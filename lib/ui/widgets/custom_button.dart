import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  final bool isActive;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.isActive = true,
    this.width,
    this.height,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    if (!widget.isActive) return;
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.isActive) return;
    setState(() {
      _isPressed = false;
    });
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.isActive
        ? (_isPressed ? Colors.white : mainColor)
        : unactiveColor;

    final borderColor = widget.isActive ? mainColor : unactiveColor;

    TextStyle textStyle = TextStyle(
      color: widget.isActive
          ? (_isPressed ? textColorLight : Colors.white)
          : Colors.white,
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 2,
    );

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width ?? 272,
        height: widget.height ?? 49,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: textStyle,
              child: Text(widget.text.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
