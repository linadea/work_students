import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';

class CustomIconButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  final String? iconName;
  final double? width;
  final double? height;

  const CustomIconButton({
    super.key,
    required this.text,
    this.onTap,
    required this.iconName,
    this.width,
    this.height,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
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
          color: _isPressed ? mainColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: mainColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: SvgPicture.asset(widget.iconName!,
                  key: ValueKey<bool>(_isPressed),
                  colorFilter: ColorFilter.mode(
                      _isPressed ? Colors.white : mainColor, BlendMode.srcIn)),
            ),
            const SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: _isPressed ? Colors.white : textColorLight,
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              child: Text(widget.text),
            ),
          ],
        ),
      ),
    );
  }
}
