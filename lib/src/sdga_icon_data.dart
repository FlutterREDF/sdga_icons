library sdga_icons;

import 'package:flutter/widgets.dart';

class SDGAIconData extends IconData {
  const SDGAIconData(int codePoint, String style)
      : super(
          codePoint,
          fontFamily: 'SDGAIcons$style',
          fontPackage: 'sdga_icons',
          matchTextDirection: true,
        );
}

class SDGAToneIconData extends SDGAIconData {
  const SDGAToneIconData(int codePoint, String style, this.tone)
      : super(codePoint, style);

  final SDGAIconData tone;
}