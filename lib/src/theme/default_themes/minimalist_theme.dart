import 'package:flutter/material.dart';

import '../../tab_bar_position.dart';
import '../../tab_status.dart';
import '../hidden_tabs_menu_theme_data.dart';
import '../tab_cross_axis_size_behavior.dart';
import '../tab_decoration_builder.dart';
import '../tab_theme_data.dart';
import '../tabbed_view_theme_data.dart';
import '../tabs_area_theme_data.dart';

/// Predefined minimalist theme builder.
class MinimalistTheme extends TabbedViewThemeData {
  MinimalistTheme._(
      {required this.color,
      required this.selectedColor,
      required this.hoveredColor,
      required this.tabRadius});

  factory MinimalistTheme(
      {required Brightness brightness,
      required MaterialColor colorSet,
      required double fontSize,
      required double initialGap,
      required double gap,
      required double? tabRadius}) {
    final bool isLight = brightness == Brightness.light;

    final Color color = isLight ? colorSet[300]! : colorSet[900]!;
    final Color selectedColor = isLight ? colorSet[800]! : colorSet[300]!;
    final Color hoveredColor = isLight ? colorSet[400]! : colorSet[800]!;
    final Color buttonColor = isLight ? colorSet[800]! : colorSet[100]!;
    final Color disabledButtonColor = isLight ? colorSet[400]! : colorSet[600]!;
    final Color fontColor = isLight ? colorSet[900]! : colorSet[100]!;
    final Color selectedFontColor = isLight ? colorSet[100]! : colorSet[100]!;

    final MinimalistTheme theme = MinimalistTheme._(
        color: color,
        selectedColor: selectedColor,
        hoveredColor: hoveredColor,
        tabRadius: tabRadius != null ? Radius.circular(tabRadius) : null);

    theme.divider = BorderSide(color: selectedColor, width: 4);

    final TabsAreaThemeData tabsArea = theme.tabsArea;
    tabsArea.tabCrossAxisSizeBehavior = TabCrossAxisSizeBehavior.uniform;
    tabsArea.initialGap = initialGap;
    tabsArea.middleGap = gap;
    tabsArea.buttonsAreaPadding = EdgeInsets.all(4);
    tabsArea.buttonPadding = const EdgeInsets.all(4);
    tabsArea.hoveredButtonBackground = BoxDecoration(color: hoveredColor);
    tabsArea.buttonColor = buttonColor;
    tabsArea.disabledButtonColor = disabledButtonColor;
    tabsArea.dropColor = Color.fromARGB(150, 255, 255, 255);
    final TabThemeData tab = theme.tab;
    tab.buttonsOffset = 4;
    tab.textStyle = TextStyle(fontSize: fontSize, color: fontColor);
    tab.draggingDecoration = BoxDecoration(color: color);
    tab.padding = const EdgeInsets.fromLTRB(8, 4, 4, 4);
    tab.paddingWithoutButton = const EdgeInsets.fromLTRB(8, 6, 8, 2);
    tab.hoveredButtonBackground = BoxDecoration(color: hoveredColor);
    tab.buttonPadding = const EdgeInsets.all(4);
    tab.buttonColor = buttonColor;
    tab.disabledButtonColor = disabledButtonColor;
    tab.decorationBuilder = theme._tabDecorationBuilder;
    tab.selectedStatus.fontColor = selectedFontColor;
    tab.selectedStatus.buttonColor = selectedFontColor;

    final HiddenTabsMenuThemeData menu =
        HiddenTabsMenuThemeData(brightness: brightness);
    theme.menu = menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }

  final Radius? tabRadius;
  final Color color;
  final Color selectedColor;
  final Color hoveredColor;

  TabDecoration _tabDecorationBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    Color? color;
    switch (status) {
      case TabStatus.selected:
        color = selectedColor;
        break;
      case TabStatus.hovered:
        color = hoveredColor;
        break;
      case TabStatus.normal:
        color = this.color;
        break;
    }
    final Radius? radius = this.tabRadius;
    switch (tabBarPosition) {
      case TabBarPosition.top:
        return TabDecoration(
            color: color,
            borderRadius: radius != null
                ? BorderRadius.only(topLeft: radius, topRight: radius)
                : null);
      case TabBarPosition.bottom:
        return TabDecoration(
            color: color,
            borderRadius: radius != null
                ? BorderRadius.only(bottomLeft: radius, bottomRight: radius)
                : null);
      case TabBarPosition.left:
        return TabDecoration(
            color: color,
            borderRadius: radius != null
                ? BorderRadius.only(topLeft: radius, bottomLeft: radius)
                : null);
      case TabBarPosition.right:
        return TabDecoration(
            color: color,
            borderRadius: radius != null
                ? BorderRadius.only(topRight: radius, bottomRight: radius)
                : null);
    }
  }
}
