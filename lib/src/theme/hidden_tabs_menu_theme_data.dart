import 'package:flutter/material.dart';

/// Theme for the hidden tabs menu.
class HiddenTabsMenuThemeData {
  HiddenTabsMenuThemeData._(
      {required this.darkMenu,
      required this.lightMenu,
      required this.borderRadius,
      required this.margin,
      required this.padding,
      required this.menuItemPadding,
      required this.maxWidth,
      required this.maxHeight,
      required this.ellipsisOverflowText});

  factory HiddenTabsMenuThemeData({
    BrightnessMenuThemeData? darkMenu,
    BrightnessMenuThemeData? lightMenu,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry menuItemPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    double maxWidth = 200,
    double maxHeight = 400,
    bool ellipsisOverflowText = false,
  }) {
    darkMenu = darkMenu ??
        BrightnessMenuThemeData(
          color: Colors.black54,
          textStyle: TextStyle(color: Colors.grey[50]),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 4,
                offset: const Offset(0, 2))
          ],
        );
    lightMenu = lightMenu ??
        BrightnessMenuThemeData(
          color: Colors.grey[50]!,
          textStyle: TextStyle(color: Colors.black),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 4,
                offset: const Offset(0, 2))
          ],
        );

    return HiddenTabsMenuThemeData._(
        darkMenu: darkMenu,
        lightMenu: lightMenu,
        ellipsisOverflowText: ellipsisOverflowText,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        borderRadius: borderRadius,
        margin: margin,
        padding: padding,
        menuItemPadding: menuItemPadding);
  }

  BrightnessMenuThemeData lightMenu;
  BrightnessMenuThemeData darkMenu;

  /// The border radius of the menu.
  BorderRadius? borderRadius;

  /// The margin of the menu.
  EdgeInsetsGeometry? margin;

  /// The padding of the menu.
  EdgeInsetsGeometry? padding;

  /// The padding of the menu item.
  EdgeInsetsGeometry menuItemPadding;

  /// The maximum width of the menu.
  double maxWidth;

  /// The maximum height of the menu.
  double maxHeight;

  /// Whether to apply an ellipsis to long text.
  bool ellipsisOverflowText;

  BrightnessMenuThemeData getBrightnessMenuTheme(Brightness brightness) {
    return brightness == Brightness.dark ? darkMenu : lightMenu;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiddenTabsMenuThemeData &&
          runtimeType == other.runtimeType &&
          lightMenu == other.lightMenu &&
          darkMenu == other.darkMenu &&
          borderRadius == other.borderRadius &&
          margin == other.margin &&
          padding == other.padding &&
          menuItemPadding == other.menuItemPadding &&
          maxWidth == other.maxWidth &&
          maxHeight == other.maxHeight &&
          ellipsisOverflowText == other.ellipsisOverflowText;

  @override
  int get hashCode =>
      lightMenu.hashCode ^
      darkMenu.hashCode ^
      borderRadius.hashCode ^
      margin.hashCode ^
      padding.hashCode ^
      menuItemPadding.hashCode ^
      maxWidth.hashCode ^
      maxHeight.hashCode ^
      ellipsisOverflowText.hashCode;
}

/// Theming for brightness mode menus
class BrightnessMenuThemeData {
  BrightnessMenuThemeData(
      {required this.color,
      this.boxShadow,
      this.border,
      this.textStyle,
      this.blur = true,
      this.dividerThickness = 0,
      this.dividerColor,
      this.hoverColor,
      this.highlightColor});

  /// The color of the menu.
  Color color;

  /// A list of shadows cast by this box behind the menu.
  List<BoxShadow>? boxShadow;

  /// The border of the menu.
  Border? border;

  /// The [TextStyle] of the menu item.
  TextStyle? textStyle;

  /// The blur effect.
  bool blur;

  /// The thickness of the divider.
  double dividerThickness;

  /// The color of the divider.
  Color? dividerColor;

  /// The color of the menu item when the mouse is over it.
  Color? hoverColor;

  /// The highlight color of the menu item when pressed.
  Color? highlightColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrightnessMenuThemeData &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          boxShadow == other.boxShadow &&
          border == other.border &&
          textStyle == other.textStyle &&
          blur == other.blur &&
          dividerThickness == other.dividerThickness &&
          dividerColor == other.dividerColor &&
          hoverColor == other.hoverColor &&
          highlightColor == other.highlightColor;

  @override
  int get hashCode =>
      color.hashCode ^
      boxShadow.hashCode ^
      border.hashCode ^
      textStyle.hashCode ^
      blur.hashCode ^
      dividerThickness.hashCode ^
      dividerColor.hashCode ^
      hoverColor.hashCode ^
      highlightColor.hashCode;
}
