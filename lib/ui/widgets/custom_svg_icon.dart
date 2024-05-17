import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String assetName;
  final bool isSelected;
  final double height;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomSvgIcon({
    super.key,
    required this.assetName,
    required this.isSelected,
    required this.height,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      colorFilter: ColorFilter.mode(
        isSelected ? selectedColor : unselectedColor,
        BlendMode.srcIn,
      ),
    );
  }
}
