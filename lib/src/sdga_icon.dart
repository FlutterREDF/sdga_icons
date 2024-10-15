library sdga_icons;

import 'package:flutter/material.dart';
import 'package:sdga_icons/sdga_icons.dart';

class SDGAIcon extends Icon {
  const SDGAIcon(
    IconData icon, {
    Key? key,
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    this.toneOpacity = 0.40,
    this.toneColor,
  }) : super(
          icon,
          color: color,
          fill: fill,
          grade: grade,
          key: key,
          opticalSize: opticalSize,
          semanticLabel: semanticLabel,
          shadows: shadows,
          size: size,
          textDirection: textDirection,
          weight: weight,
        );

  final double toneOpacity;
  final Color? toneColor;

  @override
  Widget build(BuildContext context) {
    if (icon is SDGAToneIconData) {
      final toneIcon = icon as SDGAToneIconData;
      if (toneIcon.codePoint == 0x0) return _buildTone(toneIcon.tone);
      return Stack(
        alignment: Alignment.center,
        children: [
          _buildTone(toneIcon.tone),
          super.build(context),
        ],
      );
    }
    return super.build(context);
  }

  Widget _buildTone(SDGAIconData tone) => Opacity(
        opacity: toneOpacity,
        child: Icon(
          tone,
          key: key,
          size: size,
          fill: fill,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          color: toneColor ?? color,
          shadows: shadows,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        ),
      );
}
