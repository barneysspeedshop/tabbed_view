import 'package:flutter/material.dart';

/// Theme for the hidden tabs menu.
class HiddenTabsMenuThemeData {
  HiddenTabsMenuThemeData._(
      {required this.color,
      required this.boxShadow,
      required this.border,
      required this.textStyle,
      required this.dividerThickness,
      required this.dividerColor,
      required this.hoverColor,
      required this.highlightColor,
      required this.borderRadius,
      required this.margin,
      required this.padding,
      required this.menuItemPadding,
      required this.maxWidth,
      required this.maxHeight,
      required this.ellipsisOverflowText});

  factory HiddenTabsMenuThemeData({
    Brightness? brightness,
    Color? color,
    List<BoxShadow>? boxShadow,
    Border? border,
    TextStyle? textStyle,
    double dividerThickness = 0,
    Color? dividerColor,
    Color? hoverColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry menuItemPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    double maxWidth = 200,
    double maxHeight = 400,
    bool ellipsisOverflowText = false,
  }) {
    if (brightness != null) {
      final bool isLight = brightness == Brightness.light;
      color = color ?? (isLight ? Colors.grey[50] : Colors.grey[900]);
    }

    boxShadow = boxShadow ??
        [
          BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 4,
              offset: const Offset(0, 2))
        ];

    return HiddenTabsMenuThemeData._(
        color: color,
        boxShadow: boxShadow,
        border: border,
        textStyle: textStyle,
        dividerThickness: dividerThickness,
        dividerColor: dividerColor,
        highlightColor: highlightColor,
        hoverColor: hoverColor,
        ellipsisOverflowText: ellipsisOverflowText,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        borderRadius: borderRadius,
        margin: margin,
        padding: padding,
        menuItemPadding: menuItemPadding);
  }

  /// The color of the menu.
  Color? color;

  /// A list of shadows cast by this box behind the menu.
  List<BoxShadow>? boxShadow;

  /// The border of the menu.
  Border? border;

  /// The [TextStyle] of the menu item.
  TextStyle? textStyle;

  /// The thickness of the divider.
  double dividerThickness;

  /// The color of the divider.
  Color? dividerColor;

  /// The color of the menu item when the mouse is over it.
  Color? hoverColor;

  /// The highlight color of the menu item when pressed.
  Color? highlightColor;

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiddenTabsMenuThemeData &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          boxShadow == other.boxShadow &&
          border == other.border &&
          textStyle == other.textStyle &&
          dividerThickness == other.dividerThickness &&
          dividerColor == other.dividerColor &&
          hoverColor == other.hoverColor &&
          highlightColor == other.highlightColor &&
          borderRadius == other.borderRadius &&
          margin == other.margin &&
          padding == other.padding &&
          menuItemPadding == other.menuItemPadding &&
          maxWidth == other.maxWidth &&
          maxHeight == other.maxHeight &&
          ellipsisOverflowText == other.ellipsisOverflowText;

  @override
  int get hashCode => Object.hash(
      color,
      boxShadow,
      border,
      textStyle,
      dividerThickness,
      dividerColor,
      hoverColor,
      highlightColor,
      borderRadius,
      margin,
      padding,
      menuItemPadding,
      maxWidth,
      maxHeight,
      ellipsisOverflowText);
}
