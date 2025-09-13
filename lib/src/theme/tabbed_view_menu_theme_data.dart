import 'package:flutter/material.dart';

import '../icon_provider.dart';
import '../tabbed_view_icons.dart';

/// Defines the visual properties for the menus used in [TabbedView].
///
/// This theme is applied both to:
///  - The main tab menu (context menu of a tab).
///  - The "hidden tabs" overflow menu button.
///
/// By customizing this class, you can control the look and feel
/// of both menus consistently.
class TabbedViewMenuThemeData {
  /// Creates a theme for tabbed view menus.
  ///
  /// All parameters are optional. If a property is `null`, the default
  /// value defined by the system or widget will be used.
  TabbedViewMenuThemeData(
      {this.style,
      this.menuItemStyle,
      this.textStyle,
      this.padding,
      this.maxWidth,
      this.maxHeight,
      this.ellipsisOverflowText = false,
      IconProvider? menuIcon})
      : menuIcon = menuIcon ?? IconProvider.path(TabbedViewIcons.menu);

  /// The overall [MenuStyle] for the menu container.
  ///
  /// Controls properties such as background color, elevation, shape,
  /// and surface tint.
  MenuStyle? style;

  /// The [ButtonStyle] applied to each menu item.
  ///
  /// Use this to control the item background color, hover/pressed
  /// effects, or padding.
  ButtonStyle? menuItemStyle;

  /// The [TextStyle] of the menu items.
  ///
  /// If `null`, the default text style from the current theme is used.
  TextStyle? textStyle;

  /// The padding around the entire menu content.
  EdgeInsetsGeometry? padding;

  /// The maximum width of the menu.
  ///
  /// If the menu content exceeds this value, the layout will be
  /// constrained accordingly.
  double? maxWidth;

  /// The maximum height of the menu.
  ///
  /// If the menu items exceed this value, the menu will become scrollable.
  double? maxHeight;

  /// Whether to apply an ellipsis (`...`) to text that does not fit.
  ///
  /// If `true`, overflowing text in menu items will be truncated
  /// with an ellipsis.
  bool ellipsisOverflowText;

  /// Icon for the hidden tabs menu.
  IconProvider menuIcon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabbedViewMenuThemeData &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          menuItemStyle == other.menuItemStyle &&
          textStyle == other.textStyle &&
          padding == other.padding &&
          maxWidth == other.maxWidth &&
          maxHeight == other.maxHeight &&
          ellipsisOverflowText == other.ellipsisOverflowText &&
          menuIcon == other.menuIcon;

  @override
  int get hashCode => Object.hash(style, menuItemStyle, textStyle, padding,
      maxWidth, maxHeight, ellipsisOverflowText, menuIcon);
}
