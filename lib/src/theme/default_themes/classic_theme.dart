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

/// Predefined classic theme builder.
class ClassicTheme extends TabbedViewThemeData {
  ClassicTheme._({required this.borderColor});

  factory ClassicTheme(
      {required MaterialColor colorSet,
      required double fontSize,
      required Color borderColor}) {
    Color backgroundColor = colorSet[50]!;
    Color hoveredColor = colorSet[300]!;
    Color fontColor = colorSet[900]!;
    Color normalButtonColor = colorSet[900]!;
    Color disabledButtonColor = colorSet[400]!;
    Color hoverButtonColor = colorSet[900]!;

    ClassicTheme theme = ClassicTheme._(borderColor: borderColor);

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
    tab.color = backgroundColor;
    tab.textStyle = TextStyle(fontSize: fontSize, color: fontColor);
    tab.normalButtonColor = normalButtonColor;
    tab.hoverButtonColor = hoverButtonColor;
    tab.disabledButtonColor = disabledButtonColor;
    tab.hoverButtonBackground = BoxDecoration(color: hoveredColor);
    tab.buttonsOffset = 4;
    tab.buttonPadding = const EdgeInsets.all(2);
    tab.padding = EdgeInsets.fromLTRB(6, 3, 3, 3);
    tab.paddingWithoutButton = EdgeInsets.fromLTRB(6, 3, 6, 3);
    tab.draggingDecoration = BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1));
    tab.borderBuilder = theme._tabBorderBuilder;

    final ContentAreaThemeData contentArea = theme.contentArea;
    contentArea.color = backgroundColor;
    contentArea.border = BorderSide(width: 1, color: borderColor);

    final HiddenTabsMenuThemeData menu = theme.menu;
    menu.borderRadius = BorderRadius.circular(4);

    return theme;
  }

  Color borderColor;

  TabBorder _tabBorderBuilder(
      {required TabBarPosition tabBarPosition, required TabStatus status}) {
    final BorderSide borderSide = status == TabStatus.selected
        ? BorderSide(color: Colors.transparent, width: 8)
        : divider ?? BorderSide.none;
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
    switch (tabBarPosition) {
      case TabBarPosition.top:
        return TabBorder(
            border:
                Border(top: borderSide, left: borderSide, right: borderSide));
      case TabBarPosition.bottom:
        return TabBorder(
            border: Border(
                bottom: borderSide, left: borderSide, right: borderSide));
      case TabBarPosition.left:
        return TabBorder(
            border:
                Border(left: borderSide, top: borderSide, bottom: borderSide));
      case TabBarPosition.right:
        return TabBorder(
            border:
                Border(right: borderSide, top: borderSide, bottom: borderSide));
    }
  }
}
