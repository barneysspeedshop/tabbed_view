import 'package:flutter/widgets.dart';

/// Theme for tab in a given status.
/// Allows you to overwrite [TabThemeData] properties.
class TabStatusThemeData {
  TabStatusThemeData(
      {this.fontColor,
      this.padding,
      this.paddingWithoutButton,
      this.buttonColor,
      this.hoveredButtonColor,
      this.disabledButtonColor,
      this.buttonBackground,
      this.hoveredButtonBackground,
      this.disabledButtonBackground});

  /// Padding for tab content
  EdgeInsetsGeometry? padding;

  /// Overrides [padding] when the tab has no buttons.
  EdgeInsetsGeometry? paddingWithoutButton;

  Color? fontColor;
  Color? buttonColor;
  Color? hoveredButtonColor;
  Color? disabledButtonColor;
  BoxDecoration? buttonBackground;
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
          buttonColor == other.buttonColor &&
          hoveredButtonColor == other.hoveredButtonColor &&
          disabledButtonColor == other.disabledButtonColor &&
          buttonBackground == other.buttonBackground &&
          hoveredButtonBackground == other.hoveredButtonBackground &&
          disabledButtonBackground == other.disabledButtonBackground;

  @override
  int get hashCode =>
      padding.hashCode ^
      paddingWithoutButton.hashCode ^
      fontColor.hashCode ^
      buttonColor.hashCode ^
      hoveredButtonColor.hashCode ^
      disabledButtonColor.hashCode ^
      buttonBackground.hashCode ^
      hoveredButtonBackground.hashCode ^
      disabledButtonBackground.hashCode;
}
