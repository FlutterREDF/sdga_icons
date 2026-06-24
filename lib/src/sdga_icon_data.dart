import 'package:flutter/widgets.dart';

/// A wrapper for [IconData] to ensure type safety and correct rendering
/// within the SDGA design system icon package.
///
/// This class encapsulates the underlying icon data to prevent direct inheritance
/// from Flutter's final [IconData] class.
@immutable
class SDGAIconData {
  /// The underlying [IconData] for this SDGA icon.
  final IconData data;

  /// Creates a compile-time constant wrapper for the given SDGA icon [data].
  const SDGAIconData(this.data);

  /// The unicode code point for this icon.
  int get codePoint => data.codePoint;

  /// The font family used to render this icon.
  String? get fontFamily => data.fontFamily;

  /// The package containing the icon font.
  String? get fontPackage => data.fontPackage;

  /// Whether this icon should mirror in right-to-left (RTL) contexts.
  bool get matchTextDirection => data.matchTextDirection;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SDGAIconData && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'SDGAIconData(data: $data)';
}

/// A specialized SDGA icon data representation that features an additional
/// decorative or functional secondary layer ([tone]).
@immutable
final class SDGAToneIconData extends SDGAIconData {
  /// The secondary layer or tone configuration associated with this icon.
  final IconData tone;

  /// Creates a compile-time constant dual-layer icon configuration.
  ///
  /// Accepts a [base] layer to fulfill [SDGAIconData] and a secondary [tone] layer.
  const SDGAToneIconData(
    IconData base,
    this.tone,
  ) : super(base);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SDGAToneIconData &&
        other.data == data &&
        other.tone == tone;
  }

  @override
  int get hashCode => Object.hash(data, tone);

  @override
  String toString() => 'SDGAToneIconData(base: $data, tone: $tone)';
}
