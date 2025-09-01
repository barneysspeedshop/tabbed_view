import 'package:flutter/material.dart';

import '../../tab_bar_position.dart';
import '../../tab_status.dart';
import '../hidden_tabs_menu_theme_data.dart';
import '../tab_decoration_builder.dart';
import '../tabbed_view_theme_data.dart';
import '../tabs_area_cross_axis_fit.dart';

/// Predefined underline theme builder.
class UnderlineTheme extends TabbedViewThemeData {
  UnderlineTheme(
      {required Brightness brightness,
      required MaterialColor colorSet,
      required MaterialColor underlineColorSet,
      required double fontSize}) {
    final bool isLight = brightness == Brightness.light;

    _borderColor = isLight ? colorSet[500]! : colorSet[800]!;
    final Color foregroundColor = isLight ? colorSet[900]! : colorSet[100]!;
    final Color backgroundColor = isLight ? colorSet[50]! : colorSet[900]!;
    final Color buttonColor = isLight ? colorSet[700]! : colorSet[200]!;
    final Color disabledButtonColor = isLight ? colorSet[400]! : colorSet[600]!;
    final Color hoveredButtonColor = isLight ? colorSet[900]! : colorSet[300]!;
    _hoveredColor = isLight ? colorSet[400]! : colorSet[600]!;
    _selectedColor = underlineColorSet;

    divider = BorderSide(color: _borderColor, width: 1);

    tabsArea.crossAxisFit = TabsAreaCrossAxisFit.all;
    tabsArea.initialGap = -1;
    tabsArea.middleGap = -1;
    tabsArea.buttonColor = buttonColor;
    tabsArea.hoveredButtonColor = hoveredButtonColor;
    tabsArea.disabledButtonColor = disabledButtonColor;
    tabsArea.buttonsAreaPadding = EdgeInsets.all(2);
    tabsArea.hoveredButtonBackground = BoxDecoration(color: _hoveredColor);
    tabsArea.buttonPadding = const EdgeInsets.all(2);
    tabsArea.border = BorderSide(color: _borderColor, width: 1);
    tabsArea.color = backgroundColor;

    tab.buttonColor = buttonColor;
    tab.hoveredButtonColor = hoveredButtonColor;
    tab.disabledButtonColor = disabledButtonColor;
    tab.textStyle = TextStyle(fontSize: fontSize, color: foregroundColor);
    tab.buttonsOffset = 4;
    tab.padding = const EdgeInsets.fromLTRB(8, 4, 4, 0);
    tab.paddingWithoutButton = const EdgeInsets.fromLTRB(8, 7, 8, 3);
    tab.hoveredButtonBackground = BoxDecoration(color: _hoveredColor);
    tab.buttonPadding = const EdgeInsets.all(4);
    tab.draggingDecoration =
        BoxDecoration(border: Border.all(color: _borderColor, width: 1));
    tab.decorationBuilder = _tabDecorationBuilder;

    contentArea.color = backgroundColor;
    contentArea.border = BorderSide(width: 1, color: _borderColor);

    menu = HiddenTabsMenuThemeData(brightness: brightness);
    menu.borderRadius = BorderRadius.circular(4);
  }

  late final Color _borderColor;
  late final Color _hoveredColor;
  late final Color _selectedColor;

  TabDecoration _tabDecorationBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    Color? color;
    switch (status) {
      case TabStatus.selected:
        color = _selectedColor;
        break;
      case TabStatus.hovered:
        color = _hoveredColor;
        break;
      case TabStatus.normal:
        color = Colors.transparent;
        break;
    }
    final BorderSide borderSide = BorderSide(color: color, width: 4);
    switch (tabBarPosition) {
      case TabBarPosition.top:
        return TabDecoration(
            border: Border(bottom: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
      case TabBarPosition.bottom:
        return TabDecoration(
            border: Border(top: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
      case TabBarPosition.left:
        return TabDecoration(
            border: Border(right: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
      case TabBarPosition.right:
        return TabDecoration(
            border: Border(left: borderSide),
            wrapperBorderBuilder: _externalDecorationBuilder);
    }
  }

  TabDecoration _externalDecorationBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    final BorderSide borderSide = BorderSide(color: _borderColor, width: 1);
    if (tabBarPosition.isHorizontal) {
      return TabDecoration(border: Border(left: borderSide, right: borderSide));
    }
    return TabDecoration(border: Border(top: borderSide, bottom: borderSide));
  }
}
