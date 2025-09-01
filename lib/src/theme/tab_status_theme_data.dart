import 'package:flutter/widgets.dart';

/// Theme for tab in a given status.
/// Allows you to overwrite [TabThemeData] properties.
class TabStatusThemeData {
  TabStatusThemeData(
      {this.fontColor,
      this.padding,
      this.paddingWithoutButton,
      this.normalButtonColor,
      this.hoveredButtonColor,
      this.disabledButtonColor,
      this.normalButtonBackground,
      this.hoveredButtonBackground,
      this.disabledButtonBackground});

  /// Padding for tab content
  EdgeInsetsGeometry? padding;

  /// Overrides [padding] when the tab has no buttons.
  EdgeInsetsGeometry? paddingWithoutButton;

  Color? fontColor;
  Color? normalButtonColor;
  Color? hoveredButtonColor;
  Color? disabledButtonColor;
  BoxDecoration? normalButtonBackground;
  BoxDecoration? hoveredButtonBackground;
  BoxDecoration? disabledButtonBackground;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabStatusThemeData &&
          runtimeType == other.runtimeType &&
          padding == other.padding &&
          paddingWithoutButton == other.paddingWithoutButton &&
          fontColor == other.fontColor &&
          normalButtonColor == other.normalButtonColor &&
          hoveredButtonColor == other.hoveredButtonColor &&
          disabledButtonColor == other.disabledButtonColor &&
          normalButtonBackground == other.normalButtonBackground &&
          hoveredButtonBackground == other.hoveredButtonBackground &&
          disabledButtonBackground == other.disabledButtonBackground;

  @override
  int get hashCode =>
      padding.hashCode ^
      paddingWithoutButton.hashCode ^
      fontColor.hashCode ^
      normalButtonColor.hashCode ^
      hoveredButtonColor.hashCode ^
      disabledButtonColor.hashCode ^
      normalButtonBackground.hashCode ^
      hoveredButtonBackground.hashCode ^
      disabledButtonBackground.hashCode;
}
