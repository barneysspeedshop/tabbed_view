import 'package:flutter/material.dart';

import '../../tab_bar_position.dart';
import '../../tab_status.dart';
import '../content_area_theme_data.dart';
import '../hidden_tabs_menu_theme_data.dart';
import '../tab_decoration_builder.dart';
import '../tab_theme_data.dart';
import '../tabbed_view_theme_data.dart';
import '../tabs_area_cross_axis_fit.dart';
import '../tabs_area_theme_data.dart';

/// Predefined classic theme builder.
class ClassicTheme extends TabbedViewThemeData {
  ClassicTheme._(
      {required this.borderColor,
      required this.backgroundColor,
      required this.tabRadius});

  factory ClassicTheme(
      {required Brightness brightness,
      required MaterialColor colorSet,
      required double fontSize,
      required Color? borderColor,
      double? tabRadius}) {
    final bool isLight = brightness == Brightness.light;

    final Color backgroundColor = isLight ? colorSet[50]! : colorSet[900]!;
    final Color hoveredColor = isLight ? colorSet[300]! : colorSet[600]!;
    final Color fontColor = isLight ? colorSet[900]! : colorSet[50]!;
    final Color normalButtonColor = isLight ? colorSet[900]! : colorSet[50]!;
    final Color disabledButtonColor = isLight ? colorSet[400]! : colorSet[500]!;
    final Color hoverButtonColor = isLight ? colorSet[900]! : colorSet[50]!;
    borderColor = borderColor ?? (isLight ? colorSet[900]! : colorSet[800]!);

    final ClassicTheme theme = ClassicTheme._(
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        tabRadius: tabRadius != null ? Radius.circular(tabRadius) : null);

    theme.divider = BorderSide(color: borderColor, width: 1);
    theme.isDividerWithinTabArea = true;

    final TabsAreaThemeData tabsArea = theme.tabsArea;
    tabsArea.normalButtonColor = normalButtonColor;
    tabsArea.hoverButtonColor = hoverButtonColor;
    tabsArea.disabledButtonColor = disabledButtonColor;
    tabsArea.buttonPadding = const EdgeInsets.all(2);
    tabsArea.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tabsArea.buttonsAreaDecoration = BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1));
    tabsArea.buttonsAreaPadding = EdgeInsets.all(2);
    tabsArea.middleGap = -1;
    tabsArea.crossAxisFit = TabsAreaCrossAxisFit.none;
    tabsArea.gapBottomBorder = BorderSide(color: borderColor, width: 1);
    tabsArea.gapSideBorder = BorderSide(color: borderColor, width: 1);

    final TabThemeData tab = theme.tab;
    tab.textStyle = TextStyle(fontSize: fontSize, color: fontColor);
    tab.normalButtonColor = normalButtonColor;
    tab.hoverButtonColor = hoverButtonColor;
    tab.disabledButtonColor = disabledButtonColor;
    tab.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tab.buttonsOffset = 4;
    tab.buttonPadding = const EdgeInsets.all(4);
    tab.padding = EdgeInsets.fromLTRB(8, 4, 4, 4);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(8, 4, 8, 4);
    tab.draggingDecoration = BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1));
    tab.decorationBuilder = theme._tabDecorationBuilder;

    final ContentAreaThemeData contentArea = theme.contentArea;
    contentArea.color = backgroundColor;
    contentArea.border = BorderSide(width: 1, color: borderColor);

    final HiddenTabsMenuThemeData menu =
        HiddenTabsMenuThemeData(brightness: brightness);
    theme.menu = menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }

  final Color backgroundColor;
  final Color borderColor;
  final Radius? tabRadius;

  TabDecoration _tabDecorationBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    final BorderSide borderSide = status == TabStatus.selected
        ? BorderSide(color: backgroundColor, width: 10)
        : divider ?? BorderSide.none;
    switch (tabBarPosition) {
      case TabBarPosition.top:
        return TabDecoration(
            color: backgroundColor,
            border: Border(bottom: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
      case TabBarPosition.bottom:
        return TabDecoration(
            color: backgroundColor,
            border: Border(top: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
      case TabBarPosition.left:
        return TabDecoration(
            color: backgroundColor,
            border: Border(right: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
      case TabBarPosition.right:
        return TabDecoration(
            color: backgroundColor,
            border: Border(left: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
    }
  }

  TabDecoration _externalDecorationBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    final BorderSide borderSide = BorderSide(color: borderColor, width: 1);
    final Radius? radius = this.tabRadius;
    switch (tabBarPosition) {
      case TabBarPosition.top:
        return TabDecoration(
            border:
                Border(top: borderSide, left: borderSide, right: borderSide),
            borderRadius: radius != null
                ? BorderRadius.only(topLeft: radius, topRight: radius)
                : null);
      case TabBarPosition.bottom:
        return TabDecoration(
            border:
                Border(bottom: borderSide, left: borderSide, right: borderSide),
            borderRadius: radius != null
                ? BorderRadius.only(bottomLeft: radius, bottomRight: radius)
                : null);
      case TabBarPosition.left:
        return TabDecoration(
            border:
                Border(left: borderSide, top: borderSide, bottom: borderSide),
            borderRadius: radius != null
                ? BorderRadius.only(topLeft: radius, bottomLeft: radius)
                : null);
      case TabBarPosition.right:
        return TabDecoration(
            border:
                Border(right: borderSide, top: borderSide, bottom: borderSide),
            borderRadius: radius != null
                ? BorderRadius.only(topRight: radius, bottomRight: radius)
                : null);
    }
  }
}
