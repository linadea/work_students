import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/colors.dart';

class LabeledInputField extends StatefulWidget {
  final String label;
  final String? iconName;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const LabeledInputField({
    super.key,
    required this.label,
    this.iconName,
    this.controller,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  State<LabeledInputField> createState() => _LabeledInputFieldState();
}

class _LabeledInputFieldState extends State<LabeledInputField> {
  late Color borderColor;
  late Color iconColor;

  @override
  void initState() {
    super.initState();
    borderColor = greyColor;
    iconColor = greyColor;
  }

  void _onFocusChange(bool hasFocus) {
    setState(() {
      borderColor = hasFocus ? mainColor : greyColor;
      iconColor = hasFocus ? mainColor : greyColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: borderColor,
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 4),
        Focus(
          onFocusChange: _onFocusChange,
          child: TextField(
            controller: widget.controller,
            style: const TextStyle(
              color: textColorLight,
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              // height: 20,
            ),
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              prefixIcon: widget.iconName != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        widget.iconName!,
                        colorFilter:
                            ColorFilter.mode(iconColor, BlendMode.srcIn),
                      ),
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: mainColor, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
