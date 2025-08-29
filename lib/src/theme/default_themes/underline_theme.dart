import 'package:flutter/material.dart';

import '../../tab_bar_position.dart';
import '../../tab_status.dart';
import '../content_area_theme_data.dart';
import '../hidden_tabs_menu_theme_data.dart';
import '../tab_border_builder.dart';
import '../tab_theme_data.dart';
import '../tabbed_view_theme_data.dart';
import '../tabs_area_cross_axis_fit.dart';
import '../tabs_area_theme_data.dart';

/// Predefined underline theme builder.
class UnderlineTheme extends TabbedViewThemeData {
  UnderlineTheme._(
      {required this.borderColor,
      required this.hoveredColor,
      required this.selectedColor});

  factory UnderlineTheme(
      {required Brightness brightness,
      required MaterialColor colorSet,
      required MaterialColor underlineColorSet,
      required double fontSize}) {
    final bool isLight = brightness == Brightness.light;

    final Color borderColor = isLight ? colorSet[500]! : colorSet[800]!;
    final Color foregroundColor = isLight ? colorSet[900]! : colorSet[100]!;
    final Color backgroundColor = isLight ? colorSet[50]! : colorSet[900]!;
    final Color normalButtonColor = isLight ? colorSet[700]! : colorSet[200]!;
    final Color disabledButtonColor = isLight ? colorSet[300]! : colorSet[400]!;
    final Color hoverButtonColor = isLight ? colorSet[900]! : colorSet[300]!;
    final Color hoveredColor = isLight ? colorSet[300]! : colorSet[700]!;

    final UnderlineTheme theme = UnderlineTheme._(
        borderColor: borderColor,
        hoveredColor: hoveredColor,
        selectedColor: underlineColorSet);

    theme.divider = BorderSide(color: borderColor, width: 1);

    final TabsAreaThemeData tabsArea = theme.tabsArea;
    tabsArea.crossAxisFit = TabsAreaCrossAxisFit.all;
    tabsArea.initialGap = -1;
    tabsArea.middleGap = -1;
    tabsArea.normalButtonColor = normalButtonColor;
    tabsArea.hoverButtonColor = hoverButtonColor;
    tabsArea.disabledButtonColor = disabledButtonColor;
    tabsArea.buttonsAreaPadding = EdgeInsets.all(2);
    tabsArea.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tabsArea.buttonPadding = const EdgeInsets.all(2);
    tabsArea.border = BorderSide(color: borderColor, width: 1);
    tabsArea.color = backgroundColor;

    final TabThemeData tab = theme.tab;
    tab.normalButtonColor = normalButtonColor;
    tab.hoverButtonColor = hoverButtonColor;
    tab.disabledButtonColor = disabledButtonColor;
    tab.textStyle = TextStyle(fontSize: fontSize, color: foregroundColor);
    tab.buttonsOffset = 4;
    tab.padding = EdgeInsets.fromLTRB(8, 4, 4, 4);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(8, 4, 8, 4);
    tab.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tab.buttonPadding = const EdgeInsets.all(4);
    tab.draggingDecoration =
        BoxDecoration(border: Border.all(color: borderColor, width: 1));
    tab.borderBuilder = theme._tabBorderBuilder;

    final ContentAreaThemeData contentArea = theme.contentArea;
    // For the mobile theme, the content area is a distinct, bordered box
    // that does not try to connect its border with the tabs area. A full
    // border works for any TabBarPosition.
    contentArea.color = backgroundColor;
    contentArea.border = BorderSide(width: 1, color: borderColor);

    final HiddenTabsMenuThemeData menu =
        HiddenTabsMenuThemeData(brightness: brightness);
    theme.menu = menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }

  Color borderColor;
  Color hoveredColor;
  Color selectedColor;

  TabBorder _tabBorderBuilder(
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
        color = Colors.transparent;
        break;
    }
    final BorderSide borderSide = BorderSide(color: color, width: 5);
    switch (tabBarPosition) {
      case TabBarPosition.top:
        return TabBorder(
            border: Border(bottom: borderSide),
            wrapperBorderBuilder: _externalBorderBuilder);
      case TabBarPosition.bottom:
        return TabBorder(
            border: Border(top: borderSide),
            wrapperBorderBuilder: _externalBorderBuilder);
      case TabBarPosition.left:
        return TabBorder(
            border: Border(right: borderSide),
            wrapperBorderBuilder: _externalBorderBuilder);
      case TabBarPosition.right:
        return TabBorder(
            border: Border(left: borderSide),
            wrapperBorderBuilder: _externalBorderBuilder);
    }
  }

  TabBorder _externalBorderBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    final BorderSide borderSide = BorderSide(color: borderColor, width: 1);
    if (tabBarPosition.isHorizontal) {
      return TabBorder(border: Border(left: borderSide, right: borderSide));
    }
    return TabBorder(border: Border(top: borderSide, bottom: borderSide));
  }
}
