import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';

class CustomCheckboxButton extends StatefulWidget {
  final String text;
  final String? iconName;
  final bool? isChecked;
  final void Function(bool)? onChanged;
  final double? width;
  final double? height;

  const CustomCheckboxButton({
    super.key,
    required this.text,
    required this.iconName,
    this.onChanged,
    this.isChecked,
    this.width,
    this.height,
  });

  @override
  State<CustomCheckboxButton> createState() => _CustomCheckboxButtonState();
}

class _CustomCheckboxButtonState extends State<CustomCheckboxButton> {
  bool _isChecked = false;

  void _handleTap() {
    setState(() {
      _isChecked = !_isChecked;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_isChecked);
    }
  }

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked ?? false;
  }

  @override
  void didUpdateWidget(covariant CustomCheckboxButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isChecked != widget.isChecked) {
      setState(() {
        _isChecked = widget.isChecked ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width ?? 272,
        height: widget.height ?? 49,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isChecked ? mainColor : Colors.white,
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
              child: SvgPicture.asset(
                widget.iconName!,
                key: ValueKey<bool>(_isChecked),
                colorFilter: ColorFilter.mode(
                  _isChecked ? Colors.white : mainColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: _isChecked ? Colors.white : textColorLight,
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
