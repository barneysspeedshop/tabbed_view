import 'package:flutter/widgets.dart';

/// Theme for tab in a given status.
/// Allows you to overwrite [TabThemeData] properties.
class TabStatusThemeData {
  TabStatusThemeData(
      {this.background,
      this.fontColor,
      this.padding,
      this.paddingWithoutButton,
      this.normalButtonColor,
      this.hoverButtonColor,
      this.disabledButtonColor,
      this.normalButtonBackground,
      this.hoverButtonBackground,
      this.disabledButtonBackground});

  Color? background;

  /// Padding for tab content
  EdgeInsetsGeometry? padding;

  /// Overrides [padding] when the tab has no buttons.
  EdgeInsetsGeometry? paddingWithoutButton;

  Color? fontColor;
  Color? normalButtonColor;
  Color? hoverButtonColor;
  Color? disabledButtonColor;
  BoxDecoration? normalButtonBackground;
  BoxDecoration? hoverButtonBackground;
  BoxDecoration? disabledButtonBackground;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabStatusThemeData &&
          runtimeType == other.runtimeType &&
          background == other.background &&
          padding == other.padding &&
          paddingWithoutButton == other.paddingWithoutButton &&
          fontColor == other.fontColor &&
          normalButtonColor == other.normalButtonColor &&
          hoverButtonColor == other.hoverButtonColor &&
          disabledButtonColor == other.disabledButtonColor &&
          normalButtonBackground == other.normalButtonBackground &&
          hoverButtonBackground == other.hoverButtonBackground &&
          disabledButtonBackground == other.disabledButtonBackground;

  @override
  int get hashCode =>
      background.hashCode ^
      padding.hashCode ^
      paddingWithoutButton.hashCode ^
      fontColor.hashCode ^
      normalButtonColor.hashCode ^
      hoverButtonColor.hashCode ^
      disabledButtonColor.hashCode ^
      normalButtonBackground.hashCode ^
      hoverButtonBackground.hashCode ^
      disabledButtonBackground.hashCode;
}
