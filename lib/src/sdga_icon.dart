library sdga_icons;

import 'package:flutter/material.dart';
import 'package:sdga_icons/sdga_icons.dart';

/// A custom Icon widget designed specifically for handling [SDGAIconData].
///
/// Automatically manages single-layer icons as well as complex dual-layer
/// tone configurations seamlessly.
class SDGAIcon extends Icon {
  const SDGAIcon(
    SDGAIconData icon, {
    super.key,
    super.size,
    super.fill,
    super.weight,
    super.grade,
    super.opticalSize,
    super.color,
    super.shadows,
    super.semanticLabel,
    super.textDirection,
    this.toneOpacity = 0.40,
    this.toneColor,
  })  : _icon = icon,
        // We pass null to the super constructor because Dart does not allow
        // accessing properties of a parameter (icon.data) in a const
        // constructor initializer. We override the 'icon' getter below instead.
        super(null);

  /// The private backend reference holding the wrapped SDGA icon data.
  final SDGAIconData _icon;

  /// The opacity applied to the secondary icon tone layer. Defaults to `0.40`.
  final double toneOpacity;

  /// An optional explicit color overriding the base color for the secondary tone layer.
  final Color? toneColor;

  @override
  IconData? get icon => _icon.data;

  @override
  Widget build(BuildContext context) {
    // Safely check if the underlying icon contains a tone layer due to polymorphism
    if (_icon case SDGAToneIconData toneIcon) {
      // If the primary layer codePoint is empty/0x0, only render the background tone layer
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

  Widget _buildTone(IconData toneData) => Opacity(
        opacity: toneOpacity,
        child: Icon(
          toneData,
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
