import 'package:flutter/widgets.dart';

import 'icon_provider.dart';
import 'tabbed_view_menu_builder.dart';
import 'theme/tabbed_view_theme_constants.dart';

/// Configures a tab button.
class TabButton {
  TabButton._(
      {required this.icon,
      required this.menuBuilder,
      required this.color,
      required this.hoverColor,
      required this.disabledColor,
      required this.background,
      required this.hoverBackground,
      required this.disabledBackground,
      required this.onPressed,
      required this.toolTip,
      required this.padding,
      required double? iconSize})
      : this.iconSize = iconSize == null
            ? iconSize
            : TabbedViewThemeConstants.normalize(iconSize);

  factory TabButton.icon(IconProvider icon,
      {EdgeInsetsGeometry? padding,
      VoidCallback? onPressed,
      Color? color,
      Color? hoverColor,
      Color? disabledColor,
      BoxDecoration? background,
      BoxDecoration? hoverBackground,
      BoxDecoration? disabledBackground,
      String? toolTip,
      double? iconSize}) {
    return TabButton._(
        icon: icon,
        menuBuilder: null,
        padding: padding,
        onPressed: onPressed,
        color: color,
        hoverColor: hoverColor,
        disabledColor: disabledColor,
        background: background,
        hoverBackground: hoverBackground,
        disabledBackground: disabledBackground,
        toolTip: toolTip,
        iconSize: iconSize);
  }

  factory TabButton.menu(TabbedViewMenuBuilder? menuBuilder,
      {EdgeInsetsGeometry? padding,
      Color? color,
      Color? hoverColor,
      Color? disabledColor,
      BoxDecoration? background,
      BoxDecoration? hoverBackground,
      BoxDecoration? disabledBackground,
      String? toolTip,
      double? iconSize}) {
    return TabButton._(
        icon: null,
        menuBuilder: menuBuilder,
        padding: padding,
        onPressed: null,
        color: color,
        hoverColor: hoverColor,
        disabledColor: disabledColor,
        background: background,
        hoverBackground: hoverBackground,
        disabledBackground: disabledBackground,
        toolTip: toolTip,
        iconSize: iconSize);
  }

  final IconProvider? icon;
  final TabbedViewMenuBuilder? menuBuilder;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? hoverColor;
  final Color? disabledColor;
  final BoxDecoration? background;
  final BoxDecoration? hoverBackground;
  final BoxDecoration? disabledBackground;
  final VoidCallback? onPressed;
  final String? toolTip;
  final double? iconSize;
}
