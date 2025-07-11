import 'package:flutter/widgets.dart';

/// Theme for tab in a given status.
/// Allows you to overwrite [TabThemeData] properties.
class TabStatusThemeData {
  const TabStatusThemeData(
      {this.decoration,
      this.innerTopBorder,
      this.innerBottomBorder,
      this.fontColor,
      this.padding,
      this.paddingWithoutButton,
      this.margin,
      this.normalButtonColor,
      this.hoverButtonColor,
      this.disabledButtonColor,
      this.normalButtonBackground,
      this.hoverButtonBackground,
      this.disabledButtonBackground});

  static const TabStatusThemeData empty = TabStatusThemeData();

  /// Empty space to inscribe inside the [decoration]. The tab child, if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  final EdgeInsetsGeometry? padding;

  /// Overrides [padding] when the tab has no buttons.
  final EdgeInsetsGeometry? paddingWithoutButton;

  /// Empty space to surround the [decoration] and tab.
  final EdgeInsetsGeometry? margin;

  /// The decoration to paint behind the tab.
  final BoxDecoration? decoration;
  final BorderSide? innerBottomBorder;
  final BorderSide? innerTopBorder;
  final Color? fontColor;
  final Color? normalButtonColor;
  final Color? hoverButtonColor;
  final Color? disabledButtonColor;
  final BoxDecoration? normalButtonBackground;
  final BoxDecoration? hoverButtonBackground;
  final BoxDecoration? disabledButtonBackground;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabStatusThemeData &&
          runtimeType == other.runtimeType &&
          padding == other.padding &&
          paddingWithoutButton == other.paddingWithoutButton &&
          margin == other.margin &&
          decoration == other.decoration &&
          innerBottomBorder == other.innerBottomBorder &&
          innerTopBorder == other.innerTopBorder &&
          fontColor == other.fontColor &&
          normalButtonColor == other.normalButtonColor &&
          hoverButtonColor == other.hoverButtonColor &&
          disabledButtonColor == other.disabledButtonColor &&
          normalButtonBackground == other.normalButtonBackground &&
          hoverButtonBackground == other.hoverButtonBackground &&
          disabledButtonBackground == other.disabledButtonBackground;

  @override
  int get hashCode =>
      padding.hashCode ^
      paddingWithoutButton.hashCode ^
      margin.hashCode ^
      decoration.hashCode ^
      innerBottomBorder.hashCode ^
      innerTopBorder.hashCode ^
      fontColor.hashCode ^
      normalButtonColor.hashCode ^
      hoverButtonColor.hashCode ^
      disabledButtonColor.hashCode ^
      normalButtonBackground.hashCode ^
      hoverButtonBackground.hashCode ^
      disabledButtonBackground.hashCode;
}
